{config,pkgs,...}:
let
  oidcProviderId = "keycloak";
  oidcClientId = "nextcloud";
  oidcDiscoveryUri = "https://keycloak.estrogen.today/realms/master/.well-known/openid-configuration";
in
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud34;
    hostName = "cloud.estrogen.today"; 
    database.createLocally = true;
    configureRedis = true;
    maxUploadSize = "32G";
    https = true;
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks oidc user_oidc;
    };
    extraAppsEnable = true;
    settings = {
      user_oidc = {
        login_label = "Log in with {name}";
      };
    };
    config = { 
      adminuser = "admin";
      adminpassFile = "/var/nextcloud-pw";
      dbtype = "pgsql";
    };
  };
  systemd.services.nextcloud-setup.serviceConfig = {
    RequiresMountsFor = [ "/var/lib/nextcloud" ];
  };
  systemd.services.nextcloud-configure-oidc = {
    description = "Configure Nextcloud OpenID Connect login with Keycloak";
    after = [ "network-online.target" "nginx.service" "keycloak.service" "nextcloud-setup.service" ];
    requires = [ "nextcloud-setup.service" ];
    wants = [ "network-online.target" "nginx.service" "keycloak.service" ];
    wantedBy = [ "multi-user.target" ];

    script = ''
      client_secret="$(<"$CREDENTIALS_DIRECTORY/client_secret")"

      ${config.services.nextcloud.occ}/bin/nextcloud-occ user_oidc:provider ${oidcProviderId} \
        --clientid="${oidcClientId}" \
        --clientsecret="$client_secret" \
        --discoveryuri="${oidcDiscoveryUri}"

      ${config.services.nextcloud.occ}/bin/nextcloud-occ config:app:set \
        --type=string \
        --value=0 \
        user_oidc \
        allow_multiple_user_backends
    '';

    serviceConfig = {
      Type = "oneshot";
      User = "nextcloud";
      LoadCredential = [
        "client_secret:/etc/nixos/secrets/nextcloud-oidc-client-secret"
      ];
    };
  };
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    
    forceSSL = true;
    enableACME = true;
  };
  services.nginx.virtualHosts.${config.services.onlyoffice.hostname} = {
    
    forceSSL = true;
    enableACME = true;
  };

  services.onlyoffice = {
    enable = false;
    hostname = "office.estrogen.today";
  };
}

{...}:
{
  services.keycloak = {
    enable = true;

    database = {
      type = "postgresql";
      createLocally = true;

      username = "keycloak";
      passwordFile = "/etc/nixos/secrets/keycloak";
    };

    settings = {
      hostname = "keycloak.estrogen.today";
      http-enabled = true;
      http-port = 38080;
      
      hostname-strict-https = true;
    };
  };
}

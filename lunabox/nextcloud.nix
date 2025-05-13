{config,pkgs,...}:
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud31;
    hostName = "cloud.estrogen.today"; 
    database.createLocally = true;
    configureRedis = true;
    maxUploadSize = "32G";
    https = true;
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks;
    };
    extraAppsEnable = true;
    config = { 
      adminuser = "admin";
      adminpassFile = "/var/nextcloud-pw";
      dbtype = "pgsql";
    };
  };
  systemd.services.nextcloud-setup.serviceConfig = {
    RequiresMountsFor = [ "/var/lib/nextcloud" ];
  };
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    
    forceSSL = true;
    enableACME = true;
  };
}

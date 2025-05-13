{config,...}:
{
  services.nextcloud = {
    enable = true;
    hostName = "cloud.estrogen.today"; 
    database.createLocally = true;
    configureRedis = true;
    maxUploadSize = "32G";
    https = true;
    enableBrokenCiphersForSSE = false;

    config = { 
      adminuser = "admin";
      adminpassFile = "/var/nextcloud-pw";
      dbtype = "pgsql";
    };
  };
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {

    forceSSL = true;
    enableACME = true;
  };
}

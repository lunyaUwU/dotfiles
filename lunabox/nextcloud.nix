{config,...}:
{
  services.nextcloud = {
    enable = true;
    hostName = "cloud.estrogen.today"; 
    config = { 
      adminpassFile = "/var/nextcloud-pw";
      dbtype = "pgsql";
    };
  };
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };
}

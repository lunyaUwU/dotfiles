{config,...}:
{
  services.nextcloud = {
    enable = true;
    hostName = "cloud.estrogen.today"; 
    config.adminpassFile = "/var/nextcloud-pw";
  };
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };
}

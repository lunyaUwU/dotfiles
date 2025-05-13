{config,...}:
{
  services.nextcloud = {
    enable = true;
    hostName = "cloud.estrogen.today"; 
  };
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };
}

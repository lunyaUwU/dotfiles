{...}:

{
  services.grafana = {
    enable = true;
    settings = {
      server = {
        # Listening Address
        http_addr = "127.0.0.1";
        # and Port
        http_port = 3500;
        # Grafana needs to know on which domain and URL it's running
        domain = "grafana.estrogen.today";
        serve_from_sub_path = true;
      };
    };
  };
  services.nginx.virtualHosts."grafana.estrogen.today" = {
    addSSL = true;
    enableACME = true;
      locations."/" = {
        proxyPass = "127.0.0.1:3500";
        #proxyWebsockets = true;
        #recommendedProxySettings = true;
    };
  };

}

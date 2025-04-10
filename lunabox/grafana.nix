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
        domain = "estrogen.today";
        root_url = "https://estrogen.today/grafana/";
        serve_from_sub_path = true;
      };
    };
  };
}

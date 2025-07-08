{config,...}:

{
  services.grafana = {
    enable = true;
    settings = {
      server = {
        # Listening Address
        http_addr = "127.0.0.1";
        # and Port
        http_port = 3050;
        # Grafana needs to know on which domain and URL it's running
        domain = "estrogen.today";
        root_url = "https://estrogen.today/grafana/";
        serve_from_sub_path = true;
      };
    };
  };
  services.prometheus = {
    enable = true;
    port = 9000;
    
    retentionTime = "180d";
    exporters = {
      node = {
        enable = true;
        enabledCollectors = [ "systemd" ];
        port = 9002;
      };
      process = {
        enable = true;
        port = 9003;
        settings.process_names = [
          { name = "java";
            cmdline = ["java"];  
          }
         ]
        ;
      };
      nginx = {
        enable = true;
        port = 9004;
      };
    };
    scrapeConfigs = [
      {
        job_name = "prometheus";
        static_configs = [{
          targets = [ 
          "127.0.0.1:${toString config.services.prometheus.exporters.process.port}" 
          "127.0.0.1:${toString config.services.prometheus.exporters.nginx.port}" 
          "127.0.0.1:9000"
          ];
        }];
      } 
      { 
        job_name = "prometheus";
        static_configs = [{
          targets = [ 
          "127.0.0.1:${toString config.services.prometheus.exporters.node.port}" 
          ];
        }];

      }
    ];

  };

}

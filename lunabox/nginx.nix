{...}:

{
  services.nginx = {
    enable = true;

    clientMaxBodySize = "16m";
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    virtualHosts = {
      "jellyfin.estrogen.today" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8096";
        };
      };
      "estrogen.today" = {
        forceSSL = true;
        enableACME = true;
        locations = {
          "/.well-known/webfinger" = {
            extraConfig = ''
              return 301 http://shrimp.estrogen.today$request_uri;
            '';
          };
          "/.well-known/host-meta" = {
            extraConfig = ''
              return 301 http://shrimp.estrogen.today$request_uri;
            '';
          };
          "/.well-known/nodeinfo" = {
            extraConfig = ''
              return 301 http://shrimp.estrogen.today$request_uri;
            '';
          };
        };
      };
      
      
#      "gts.estrogen.today" = {
#        forceSSL = true;
#        enableACME = true;
#        locations."/" = {
#          proxyPass = "http://127.0.0.1:8080";
#        };
#      };
      "shrimp.estrogen.today" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:3000";
        };
      };


    };
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "lunyathegay@systemli.org";
  };



}

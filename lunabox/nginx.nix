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
      
      "gts.estrogen.today" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8080";
        };
    };

    };
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "lunyathegay@systemli.org";
  };



}

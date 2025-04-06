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
          proxyPass = "http://localhost:8920";
        };
      };
    };

  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "lunyathegay@systemli.org";
  };



}

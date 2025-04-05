{...}:
{
  services.akkoma = {
    enable = true;
    nginx = {
      enableACME = true;
      forceSSL = true;
    };

  };
  services.akkoma.config = {
    ":pleroma" = {
      ":instance" = {
        name = "My Akkoma instance";
        description = "More detailed description";
        email = "lunyathegay@systemli.org";
        registration_open = false;
      };
      "Pleroma.Web.Endpoint" = {
        url.host = "fedi.estrogen.today";
      };
    };
  };
  services.nginx = {
    enable = true;

    clientMaxBodySize = "16m";
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
  };
}


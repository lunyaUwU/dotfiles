{pkgs,...}:
{
  services.akkoma = {
    enable = true;
    nginx = {
      enableACME = true;
      forceSSL = true;
      location = 1001;
    };
    initDb = {
      enable  = true;
      username = "akkoma";
      password = null;
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
      "Pleroma.Upload".base_url = "/var/lib/akkoma-upload";
      "Pleroma.Web.Endpoint" = {
        url.host = "fedi-test.estrogen.today";
      };
    };
  };
  }


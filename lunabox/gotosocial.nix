{...}:
{
  services.gotosocial = {
    enable = true;
    setupPostgresqlDB = true;
    settings = {
      port = 8080;
      host = "gts.estrogen.today";

    };
  };

}

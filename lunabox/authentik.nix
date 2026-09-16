{...}:
{
  services.authentik = {
    enable = true;
    # The environmentFile needs to be on the target host!
    # Best use something like sops-nix or agenix to manage it
    environmentFile = "/run/secrets/authentik/authentik-env";
    settings = {
      email = {
        host = "mail.estrogen.today";
        port = 465;
        username = "authentik@estrogen.today";
        use_tls = true;
        use_ssl = false;
        from = "authentik@estrogen.today";
      };
      disable_startup_analytics = true;
      avatars = "initials";
    };
    nginx = {
      enable = true;
      enableACME = true;
      host = "auth.estrogen.today";
    };
  };
}

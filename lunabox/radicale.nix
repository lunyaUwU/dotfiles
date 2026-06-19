{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.radicale = {
    enable = true;
    settings = {
      auth = {
        type = "htpasswd";
        htpasswd_filename = "/var/hashes/caldav";
        htpasswd_encryption = "bcrypt";
      };
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts = {
      "cal.estrogen.today" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:5232/";
          extraConfig = ''
            proxy_set_header  X-Script-Name /;
            proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass_header Authorization;
          '';
        };
      };
    };
  };
}

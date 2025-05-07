{mail-server,config,pkgs,...}:

{
  imports = [mail-server.nixosModules.default];

  
  mailserver = {
    enable = true;
    fqdn = "mail.estrogen.today";
    domains = [ "estrogen.today" "lunyathe.gay" ];

    # A list of all login accounts. To create the password hashes, use
    # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
    loginAccounts = {
      "luna@lunyathe.gay" = {
        hashedPasswordFile = "/var/luna-hash-file";
        aliases = ["admin@lunyathe.gay" "booking@lunyathe.gay" "admin@estrogen.today"];
      };
    };
    services.postfixadmin = {
      #enable = true;
      setupPasswordFile = "/var/postfixadmin-password";
      hostName = "mailadmin.estrogen.today";
      adminEmail = "adminEmail@estrogen.today";

    };
    # Use Let's Encrypt certificates. Note that this needs to set up a stripped
    # down nginx and opens port 80.
    certificateScheme = "acme-nginx";
  }; 
    services.roundcube = {
     enable = true;
     plugins = ["enigma"];
     # this is the url of the vhost, not necessarily the same as the fqdn of
     # the mailserver
     hostName = "webmail.estrogen.today";
     extraConfig = ''
       # starttls needed for authentication, so the fqdn required to match
       # the certificate
       $config['smtp_host'] = "tls://${config.mailserver.fqdn}";
       $config['smtp_user'] = "%u";
       $config['smtp_pass'] = "%p";
       $config['enigma_pgp_homedir'] = "/var/enigma_pgp"; 
       $config['enigma_pgp_binary'] = "${pkgs.gnupg}/bin/gpg2";
     '';
  };
}

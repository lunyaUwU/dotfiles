{mail-server,...}:

{
  import = [mail-server.nixosModules.default];

  
  mailserver = {
    enable = true;
    fqdn = "mail.lunyathe.gay";
    domains = [ "lunyathe.gay" ];

    # A list of all login accounts. To create the password hashes, use
    # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
    loginAccounts = {
      "luna@lunyathe.gay" = {
        hashedPasswordFile = "/var/luna-hash-file";
        aliases = ["admin@lunyathe.gay" "booking@lunyathe.gay"];
      };
    };

    # Use Let's Encrypt certificates. Note that this needs to set up a stripped
    # down nginx and opens port 80.
    certificateScheme = "acme-nginx";
  }; 

}

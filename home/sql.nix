{pkgs,...}:

{
  services.postgresql = {
    enable = true;
    #listen_addresses = "127.0.0.1";
    enableTCPIP = true;
    ensureDatabases = [ "luna" ];
    ensureUsers = [
       {
         name = "luna";
       }
       {
         name = "superuser";
       }
     ];
    authentication = pkgs.lib.mkOverride 10 ''
    #...
    #type database DBuser origin-address auth-method
    local all       all     trust
    # ipv4
    host  all      all     127.0.0.1/32   trust
    # ipv6
    host all       all     ::1/128        trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
    CREATE ROLE luna WITH LOGIN PASSWORD 'kitsune' CREATEDB;
    CREATE DATABASE kitsune;
    GRANT ALL PRIVILEGES ON DATABASE kitsune TO luna;
    '';
  };
    # redis = {
    #   package = pkgs.valkey;
    #   enable = true;
    # };
}



{...}: 
{
  services.postgresql = {
    enable = true;
    enableJIT = true;
    ensureUsers = [{
      name = "akkoma";
      ensureDBOwnership = true;
      ensureClauses = {
        createrole = true;
        superuser = true;
        createdb = true;
      };
    }
    {
      name = "postgresql";
      ensureDBOwnership = true;
      ensureClauses = {
        createrole = true;
        superuser = true;
        createdb = true;
      };
    }

    ];
    ensureDatabases = ["akkoma" "iceshrimp"];
    authentication = ''
    # TYPE  DATABASE        USER            ADDRESS                 METHOD
    local   all             all                                     peer
    '';
  };
}

{...}: 
{
  services.postgresql = {
    enable = true;
    enableJIT = true;
    ensureUsers."akkoma" = [{
      name = "akkoma";
      ensureDBOwnership = true;
      ensureClauses.createrole = true;
    }];
    ensureDatabases = ["akkoma"];
    authentication = ''
    # TYPE  DATABASE        USER            ADDRESS                 METHOD
    local   all             all                                     peer
    '';
  };
}

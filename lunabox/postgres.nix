{...}: 
{
  services.postgresql = {
    enable = true;
    enableJIT = true;
    ensureUsers = [
      {
        name = "akkoma";

      } 
    ];
    ensureDatabases = [
      "akkoma"
    ];
    authentication = ''
    # TYPE  DATABASE        USER            ADDRESS                 METHOD
    local   all             all                                     peer
    '';
  };
}

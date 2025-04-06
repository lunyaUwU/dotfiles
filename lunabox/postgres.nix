{...}: 
{
  services.postgresql = {
    enable = true;
    enableJIT = true;
    ensureUsers = [
      {
        name = "akkoma";
        ensureDBOwnership = true;
      } 
    ];
    authentication = ''
    # TYPE  DATABASE        USER            ADDRESS                 METHOD
    local   all             all                                     peer
    '';
  };
}

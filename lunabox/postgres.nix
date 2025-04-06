{...}: 
{
  services.postgresql = {
    enable = true;
    enableJIT = true;
    ensureUsers = [
      "akkoma"
    ];
    authentication = ''
    # TYPE  DATABASE        USER            ADDRESS                 METHOD
    local   all             all                                     peer
    '';
  };
}

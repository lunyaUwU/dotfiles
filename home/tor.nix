{config,pkgs, ...}:
let
services = config.services; 
in 
{
  services.tor = {
    enable = true;
    settings = {
      UseBridges = false;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      #Bridge = "obfs4 IP:ORPort [fingerprint]"
    };
  };
  services.privoxy = {
    enableTor = true;
    enable = true;
  };
}

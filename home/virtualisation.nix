{...}:
{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  networking.bridges.br0 = {
    interfaces = [
      "wlp0s20f3"
    ];
  };
 }

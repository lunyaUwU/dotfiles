{config, pkgs,nix-gaming, ...}: 
{

  imports = [nix-gaming.nixosModules.pipewireLowLatency];
  
  services.blueman.enable = true;
  networking.hostName = "shork";
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    opentabletdriver= {
      enable = true;
      daemon.enable = true;
    };
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      prime = {
  # Make sure to use the correct Bus ID values for your system!
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    pulseaudio.enable = false;
  };
  sound.enable = true;
  services.pipewire = {
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    enable = true;
    lowLatency.enable = true;
    wireplumber.enable = true;
  };
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.xkb.layout = "de";
  services.printing.enable = true;

}

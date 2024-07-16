{config, pkgs,c3d2-user,...}: 
{

  imports = [
    c3d2-user.nixosModule
  ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ xone ];
  c3d2.audioStreaming = true;  
  services.blueman.enable = true;
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.firewall.checkReversePath = false; 
  #services.xserver.videoDrivers = ["nvidia"];
 #security.pam.loginLimits = [
 #  { domain = "@kvm"; item = "memlock"; type = "soft"; value = "unlimited"; }
 #  { domain = "@kvm"; item = "memlock"; type = "hard"; value = "unlimited"; }
 #  { domain = "@libvirtd"; item = "memlock"; type = "soft"; value = "unlimited"; }
 #  { domain = "@libvirtd"; item = "memlock"; type = "hard"; value = "unlimited"; }
 #];
  hardware = {
    xone.enable = true;
    opentabletdriver= {
      enable = true;
      daemon.enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    pulseaudio.enable = false;
  };
  services.pipewire = {
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    enable = true;
    wireplumber.enable = true;
  };
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.xkb.layout = "de";
  services.printing.enable = true;

}


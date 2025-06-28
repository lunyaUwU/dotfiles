{config, pkgs,
#c3d2-user,
...}: 
{

  #imports = [
  #  c3d2-user.nixosModule
  #];
  boot.extraModulePackages = with config.boot.kernelPackages; [ xone ];
  #c3d2.audioStreaming = true;  
  services.blueman.enable = true;
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  #networking.firewall.checkReversePath = false; 

  #services.xserver.videoDrivers = ["nvidia"];
  security.pam.loginLimits = [
    { domain = "@kvm"; item = "memlock"; type = "soft"; value = "unlimited"; }
    { domain = "@kvm"; item = "memlock"; type = "hard"; value = "unlimited"; }
    { domain = "@libvirtd"; item = "memlock"; type = "soft"; value = "unlimited"; }
    { domain = "@libvirtd"; item = "memlock"; type = "hard"; value = "unlimited"; }
  ];
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
    usb-modeswitch.enable=true;
    xpadneo.enable = true;
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
  services.libinput.enable = true;
  services.libinput.mouse.additionalOptions = ''
  [ROCCAT ROCCAT Kain 100]
  MatchName=ROCCAT Kain 100
  ModelBouncingKeys=1
  '';
  
  networking.firewall = {
    allowedTCPPorts = [3818 25565 19132 19133 6030 6031 6032];
    allowedUDPPorts = [5353 21928 47809];
    allowedUDPPortRanges = [
      { from = 25565; to = 25566; }
      { from = 19132; to = 19133; }
      { from = 6033; to = 19136; }
    ];
  };
  services.udev.extraRules = ''

SUBSYSTEM=="usb",  ATTRS{idVendor}=="0416", ATTRS{idProduct}=="5020", MODE="0666"
# FIXME: the following line is not sufficient for pyhidapi.
KERNEL=="hidraw*", ATTRS{idVendor}=="0416", ATTRS{idProduct}=="5020", ATTRS{busnum}=="1", MODE="0666"

  '';
}


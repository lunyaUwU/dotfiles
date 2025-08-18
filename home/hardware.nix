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

  services.xserver.videoDrivers = ["nvidia"];
  security.pam.loginLimits = [
    { domain = "@kvm"; item = "memlock"; type = "soft"; value = "unlimited"; }
    { domain = "@kvm"; item = "memlock"; type = "hard"; value = "unlimited"; }
    { domain = "@libvirtd"; item = "memlock"; type = "soft"; value = "unlimited"; }
    { domain = "@libvirtd"; item = "memlock"; type = "hard"; value = "unlimited"; }
  ];
  services.pulseaudio.zeroconf.discovery.enable =  true;

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
  hardware.graphics = {
    enable = true;
  };
  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}


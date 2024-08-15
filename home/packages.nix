{ audio,config, lib, pkgs, nix-gaming,...}:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    substituters = ["https://lunya.cachix.org"];
    trusted-public-keys = ["lunya.cachix.org-1:dfij+/AsTSBE9hCPNIDd7dVGHpMi2P2HKSFIYUl5Zoo="];
  };
  services.xonotic.enable = true;
  services.xonotic.openFirewall = true;
  programs.steam.enable = true;
  programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
 
 };
  fonts.packages = with pkgs; [
    nerdfonts
  ];
  nixpkgs.overlays = [audio.overlays.default];
    #home-manager
  environment.systemPackages =  [
    pkgs.vim
    pkgs.wget
    pkgs.curl
#    pkgs.fido2luks
 
  ];
  programs.git.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  programs.adb.enable = true;
  users.users.luna.packages = with pkgs; [
    zed-editor
    nodejs_22
    lunar-client
    gitoxide
    vcv-rack
    wineWowPackages.stagingFull
    reaper
    lmms
    tunefish
    ardour
    fwupd
    nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    pciutils
    obs-studio 
    #schildichat-deskto
    prismlauncher
    mixxx
    bitwig-studio5-stable-latest
    krita
    typst
    arduino-ide
    firefox
    epiphany
    python3
    neovide
    flatpak
    #nitrokey-app2
    #yubikey-manager
    direnv
    alacritty
    #ccgo13
    transmission-gtk
    icoutils
    #bitwarden
    gamemode
    #ungoogled-chromium
    inkscape-with-extensions
    pfetch
    owofetch
    nasm
    binutils
    dbus-glib
    helvum
    syncthing
    lsp-plugins
    xonotic
    libremines
    vital
    distrho
    pavucontrol
   # firefox
    tree
    home-manager
    #obsidian
    #keepassxc
    kitty
    lshw
    #discord

    bottom
    linux-wifi-hotspot
    thunderbird	
   # betterbird
    osu-lazer-bin      
    #lunar-client
    hyfetch
    foliate
    signal-desktop
    lutris
    qbittorrent
    protonup-qt
    libreoffice
    hunspellDicts.de_DE
    hunspellDicts.en_US
    hunspellDicts.fr-any
    #ilocalsend
    geogebra6
    openttd
  #  cinny-desktop
    gimp
    helix
    #rustup
    #element-desktop
    rofi-wayland-unwrapped
    waybar
    dunst
    wl-clipboard
    xfce.thunar
    appimage-run
    vitetris
    #wineWowPackages.stagingFull
    zathura
    spacedrive
    slurp
    swappy
    grim
    iamb
    wlvncc
    turbovnc
    cutter
    cutterPlugins.rz-ghidra
    ffmpeg_7-full
    typescript
    rizin
  ];
} 




{ config, lib, pkgs,audio,home-manager,inputs,nix-gaming, ...}:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ audio.overlays.default ];
  nix.settings = {
    substituters = ["https://lunya.cachix.org"];
    trusted-public-keys = ["lunya.cachix.org-1:dfij+/AsTSBE9hCPNIDd7dVGHpMi2P2HKSFIYUl5Zoo="];
  };
  programs.steam.enable = true;
  programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
    };
  fonts.packages = with pkgs; [
    nerdfonts
  ];
    #home-manager
  environment.systemPackages =  [
    
    pkgs.vim
    pkgs.wget
    pkgs.curl
    pkgs.git
#    pkgs.fido2luks
 
  ];
  programs.adb.enable = true;
  services.flatpak.enable = true; 
  users.users.luna.packages = with pkgs; [
    #schildichat-deskto
    flatpak
    #nitrokey-app2
    yubikey-manager
    direnv
    alacritty
    #ccgo13
    transmission-gtk
    icoutils
    bitwarden
    gamemode
#    ungoogled-chromium
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
    nix-gaming.packages.${pkgs.system}.proton-ge      
    nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    nix-gaming.packages.${pkgs.system}.osu-stable-ll
    vital
    distrho
    pavucontrol
    firefox
    tree
    home-manager
    #obsidian
    keepassxc
    kitty
    lshw
    discord
    bottom
    minecraft
    linux-wifi-hotspot
    thunderbird	
    betterbird
    ##osu-lazer-bin      
    lunar-client
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
    cinny-desktop
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
    bitwig-studio5-latest
  ];
}

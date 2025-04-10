{ nur,audio,config, lib, pkgs, nix-gaming,inkstitch,mixbus,...}:
{
  nixpkgs.overlays = [audio.overlays.default nur.overlay];
  nixpkgs.config.android_sdk.accept_license = true;
  nixpkgs.config.allowUnfree = true;
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-chinese-addons
      fcitx5-nord
    ];
  };
  services.xserver.windowManager.i3.enable = true;
  services.xserver.enable = true;
  services.mullvad-vpn.enable = true;
  services.xserver.desktopManager.gnome.enable = true; 
  nix.settings = {
    substituters = [ "https://cosmic.cachix.org/" ];
    trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
  };
  virtualisation.docker.enable = true;
  programs.gnupg.agent = { 
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
  services.flatpak.enable = true;
  services.xonotic.enable = true;
  services.xonotic.openFirewall = true;
  programs.steam.enable = true;
  programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
 
 };
  fonts.packages = with pkgs; [
#    rPackages.phosphoricons
    pkgs.nerd-fonts.caskaydia-cove   
    pkgs.nerd-fonts.droid-sans-mono
  ];
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
  #hardware.system76.enableAll = true;
  programs.nix-ld.enable = true;
  #services.desktopManager.cosmic.enable = true;
  users.users.luna.packages = with pkgs; [
    (cutter.withPlugins (ps: with ps; [ jsdec rz-ghidra sigdb ]))
    #pkgs.nur.repos.Redrield.binaryninja 
    librewolf-wayland
    mommy
    fastfetch
    libimobiledevice
    spice
    sqlite 
    ghostty
    #ghostty.packages.x86_64-linux.default
    #discordo
    yazi
    ranger
    (discord.override {
      # withOpenASAR = true; # can do this here too
      withVencord = true;
    })
    octaveFull
    #nix-gaming.packages.wine-ge
    mixbus.packages.x86_64-linux.default
    catgirl
    zulu8
    zulu23
    pinentry-rofi
    pinentry-gnome3
    rng-tools
    gnupg
    qmidinet
    tor-browser
    p7zip-rar
    p7zip
    winetricks
    seq66
    carla
    hydrogen
    seq24
    #airwave
    jq
    localsend
    #servo
    #cookiecutter
    #inkstitch.packages.x86_64-linux.default
    #surf-display
    swww
    cardinal
    uxplay
    #gnomecast
    #go-chromecast
    catt
    #castnow
    vital
    glew
    flatpak
    quickemu
    obsidian
    zed-editor
    nodejs_22
    lunar-client
    #gitoxide
    #vcv-rack
    #wineWowPackages.full
    #wineWowPackages.stagingFull
    #wineWow64Packages.stagingFull
    #reaper
    #lmms
    #tunefish
    ardour
    fwupd
    nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    pciutils
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        waveform
      ];
    })
    #schildichat-deskto
    prismlauncher
    mixxx
    #bitwig-studio5-stable-latest
    krita
    typst
    #arduino-ide
    firefox
    #epiphany
    python3
    neovide
    flatpak
    #nitrokey-app2
    #yubikey-manager
    direnv
    alacritty
    #ccgo13
    #transmission-gtk
    icoutils
    #bitwarden
    gamemode
    ungoogled-chromium
    inkscape-with-extensions
    pfetch
    owofetch
    #nasm
    #binutils
    dbus-glib
    helvum
    #syncthing
    lsp-plugins
    xonotic
    libremines
    vital
    #distrho
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
    #thunderbird	
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
    #helix
    #rustup
    #element-desktop
    rofi-wayland-unwrapped
    waybar
    dunst
    wl-clipboard
    xfce.thunar
    appimage-run
    vitetris
    wineWowPackages.stagingFull
    zathura
    spacedrive
    slurp
    swappy
    grim
    #iamb
    #wlvncc
    #turbovnc
    #cutter
    #cutterPlugins.rz-ghidra
    ffmpeg_7-full
    typescript
    #rizin
    #sc-im
    #darktable
    surge
    helm
    x42-plugins
    zam-plugins
    calf
    #jack_rack
    tap-plugins
    csa
    #sequeler
    distrho-ports
    sqlitebrowser
    geonkick
    mpv
    chawan   
    #yabridge
    yabridgectl
    vscode
    bsequencer
    #scribus
    tenacity
    unzip
    mdbtools
    #minecraft
    bottles
    #rustdesk
    android-studio
    ghc
    riseup-vpn
    (let base = pkgs.appimageTools.defaultFhsEnvArgs; in
      pkgs.buildFHSUserEnv (base // {
      name = "fhs";
      targetPkgs = pkgs: 
        # pkgs.buildFHSUserEnv provides only a minimal FHS environment,
        # lacking many basic packages needed by most software.
        # Therefore, we need to add them manually.
        #
        # pkgs.appimageTools provides basic packages required by most software.
        (base.targetPkgs pkgs) ++ (with pkgs; [
          pkg-config
          ncurses
          # Feel free to add more packages here if needed.
        ]
      );
      profile = "export FHS=1";
      runScript = "bash";
      extraOutputsToInstall = ["dev"];
    }))
    iamb
  ];
} 








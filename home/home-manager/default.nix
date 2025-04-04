{pkgs, ... }:
{

    home.stateVersion = "23.11";
    imports = [
      ./configs.nix
      ./zsh.nix
    ];

    nixpkgs.config.allowUnfree = true;
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "pink" ];
          tweaks = [ "black" ];
          size = "compact";
          variant = "mocha";
        };
      };
      cursorTheme = {
        package = pkgs.vanilla-dmz;
        name = "Vanilla-DMZ";
      };
    };
    qt = {
      enable = true;
      platformTheme.name = "gtk3";
      style.package = pkgs.catppuccin-qt5ct;
    };
    
  home.sessionPath = [
  "$HOME/.local/share/yabridge"
  ];
  #home.packages = [pkgs.minecraft];
}

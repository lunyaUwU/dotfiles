{pkgs, ... }:
{

    home.stateVersion = "23.11";
    imports = [./configs.nix];

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
    };

  
}

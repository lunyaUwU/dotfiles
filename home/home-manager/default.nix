{ config, lib, pkgs, home-manager, ... }:
{
  imports = [home-manager.nixosModules.home-manager];

  home-manager.users.luna = {
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

  };
  
}

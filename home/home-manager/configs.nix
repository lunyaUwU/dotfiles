{ config, lib, ... }:
{
  imports = [./ranger.nix];
  home.file.waybar = {
    source = ./waybar ;
    target = "/home/luna/.config/waybar";
  };
  home.file.helix = {
    source = ./helix ;
    target = "/home/luna/.config/helix";
  };
  home.file.kitty = {
    source = ./kitty ;
    target = "/home/luna/.config/kitty";
  };
  home.file.hypr = {
    source = ./hypr ;
    target = "/home/luna/.config/hypr";
  };
  home.file.nushell1 = {
    source = ./nushell/config.nu ;
    target = "/home/luna/.config/nushell/config.nu";
  };
  home.file.nushell2 = {
    source = ./nushell/env.nu ;
    target = "/home/luna/.config/nushell/env.nu";
  };
  home.file.nheko = {
    source = ./nheko ;
    target = "/home/luna/.config/nheko";
  };
  home.file.catgirl = {
    source = ./catgirl ;
    target = "/home/luna/.config/catgirl";
  };
  home.file.hyfetch = {
    source = ./hyfetch.json ;
    target = "/home/luna/.config/hyfetch.json";
  };
}

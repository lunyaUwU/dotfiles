{ config, lib, ... }:
{
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
  home.file.nushell = {
    source = ./nushell ;
    target = "/home/luna/.config/nushell";
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

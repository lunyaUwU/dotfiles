{ config, lib, pkgs, ... }:
{
  home.file.waybar = {
    source = ./waybar ;
    target = "/home/luna/.config/waybar";
  };
}

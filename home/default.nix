{ config, lib, pkgs , inputs,nix-gaming, ... }:

{
  imports = [
    ./home-manager
    ./hardware.nix
    ../hardware-configuration.nix
    ../boot.nix
    ../cachix.nix
    ./packages.nix
    ./solokey.nix
    ./nvim.nix
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  users.users.luna = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbuser" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
        
  };
  programs.zsh.enable = true;
  system.stateVersion =  "24.05";
}

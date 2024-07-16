{ pkgs,... }:

{
  imports = [
    ./home-manager
    ./hardware.nix
    ../cachix.nix
    ./packages.nix
    ./solokey.nix
    ./nvim.nix
    ./hyprlock.nix
    ./tor.nix
    ./virtualisation.nix
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  users.users.luna = {
    group = "kittens";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbuser" "libvirtd" "kvm"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;      
  };
  users.groups.kittens = {};
  programs.zsh.enable = true;
  system.stateVersion =  "24.05";
}


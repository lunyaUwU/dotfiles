{ pkgs,... }:

{
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
 #   ./home-manager
    ./hardware.nix
    ../cachix.nix
    ./packages.nix
    ./solokey.nix
    ./nvim.nix
    ./hyprlock.nix
    ./tor.nix
    ./virtualisation.nix
    ./jellyfin.nix
    #./sql.nix
  ];
  users.users.luna = {
    group = "kittens";
    isNormalUser = true;
    extraGroups = [ "docker" "wheel" "networkmanager" "adbuser" "libvirtd" "kvm"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;      
  };
  nix.settings.trusted-users = ["luna" "@wheel"];
  nix.settings = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };
  users.groups.kittens = {};
  programs.zsh.enable = true;
  system.stateVersion =  "24.05";
}


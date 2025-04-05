{pkgs,...}:

{
  imports = [
    ./hardware-configuration.nix
    ./vaultwarden.nix
    ./xonotic.nix
    ./akkoma.nix
    ./nginx.nix
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 524288000;
  users.users.luna = {
    isNormalUser  = true;
    home  = "/home/luna";
    description  = "luna";
    extraGroups  = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys  = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICjendyGMtskVQKga3Q5ms+/9oXYMM9v/jpMl+zn1Vj0 luna@bar" ];
  };
  boot.loader.systemd-boot.enable = true;
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.openssh = {
  enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
  environment.systemPackages = with pkgs;[
    git
    neovim
  ];
 }

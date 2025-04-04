{...}:

{
  imports = [
    ./hardware-configuration.nix
  ];
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
 }

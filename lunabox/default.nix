{pkgs,...}:

{
  imports = [
    ./hardware-configuration.nix
    ./vaultwarden.nix
    ./xonotic.nix
    ./akkoma.nix
    ./akkoma-conf.nix
    ./nginx.nix
    ./sops.nix
    ./postgres.nix
    ./jellyfin.nix
    ./gotosocial.nix
  ];
  system.stateVersion = "25.05";  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 524288000;
  users.users.luna = {
    isNormalUser  = true;
    home  = "/home/luna";
    description  = "luna";
    extraGroups  = [ "wheel" "networkmanager" "docker"];
    openssh.authorizedKeys.keys  = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICjendyGMtskVQKga3Q5ms+/9oXYMM9v/jpMl+zn1Vj0 luna@bar" 
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsRsNRXUIfwPSRoY/BSK8U/y9VtgJnreMBdEMB7k/4SZ0PSlBerLJ+zbHCQoI9RAzYBarUzBIv36RCtwR0c1vZOuxfjynfTlIOVq7GEsSbVBwt/baG6/Q9J0n2fWr6Yi4uAsAbEPl0km4oxsaJQsTP9A1dcdVCxPWhI1K11yqZNYUUkCvZ96Y9jhxZaxuX6qr7xRo5AzjU8jCvkKrnHFrDUd0Yt9WzHOZ1jiQbPHcfgBL16KphauRRL8x1gZVlhVNgye5Kdj1oyx1kQC28+AvNDyAjXDrixFemLUGWTsbMX1CyvxoEfkVmzDQIp1u/oF1Q+XqrLfyGlBvHo+vNxEv6Nojugpr3SMDi08FW6E4xnedoStWPlYNQQ2BfAN2UaV79LwxoUhw/ZZYAZfS7Vwv4oUsfRu3Xygsk2Y17A7UM1EAtQZ0SSgJXgW9YtWcgfzW7eLJLzqGWBzplaPT2OZLJggxXyteYIbpyC24GA02Sp0fFQ6xmw+EwTY/JKj851zU= luna@DESKTOP-16EVC47"
    ];
  };
  boot.loader.systemd-boot.enable = true;
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.openssh = {
  enable = true;
    ports = [ 22 ];
    settings = {
      #PasswordAuthentication = true;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      #PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
  environment.systemPackages = with pkgs;[
    git
    vim
    tmux
    pkgs.dotnetPackages.aspnetcore_9_0-bin
  ];

  virtualisation.docker.rootless = { 
    enable = true;
    setSocketVariable = true;
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };
 }

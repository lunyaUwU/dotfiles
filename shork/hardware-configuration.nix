# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/6599dbbf-63f8-4719-b6c0-b434b6f3a56b";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/ae6e6b7c-6f49-4658-a686-48d291faae89";

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/6599dbbf-63f8-4719-b6c0-b434b6f3a56b";
      fsType = "btrfs";
      options = [ "subvol=root/nix" ];
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/6599dbbf-63f8-4719-b6c0-b434b6f3a56b";
      fsType = "btrfs";
      options = [ "subvol=root/var" ];
    };

  fileSystems."/var/lib" =
    { device = "/dev/disk/by-uuid/6599dbbf-63f8-4719-b6c0-b434b6f3a56b";
      fsType = "btrfs";
      options = [ "subvol=root/var/lib" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/6599dbbf-63f8-4719-b6c0-b434b6f3a56b";
      fsType = "btrfs";
      options = [ "subvol=root/var/log" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/6599dbbf-63f8-4719-b6c0-b434b6f3a56b";
      fsType = "btrfs";
      options = [ "subvol=root/home" ];
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-uuid/6599dbbf-63f8-4719-b6c0-b434b6f3a56b";
      fsType = "btrfs";
      options = [ "subvol=root/tmp" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CD47-D8CF";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/1655bd9d-a0c5-48d1-b18b-815482b7d94f"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.ap0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0f1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

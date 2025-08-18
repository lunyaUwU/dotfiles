{pkgs,...}:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./meow.nix
      ./sops.nix
    ];
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.kernelModules = [
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
  ];
  boot.kernelParams = [
    "pcie_acs_override=downstream,multifunction"
    "iommu=pt"
    "intel_iommu=on"
    "vfio_iommu_type1"#
 #"vfio.enable_unsafe_noiommu_mode=1"
 #  "vfio-pci.ids=10de:1d16"
    "kvm.ignore_msrs=1"
    "i8042.reset" "i8042.nomux"    
#"video=vesafb:off,efifb:off"
  ];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
  };
  boot.loader.systemd-boot.enable = true;
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.fwupd.enable = true;
  hardware.graphics.enable = true;
  services.fprintd.enable =  true;
  services.fprintd.tod.enable = true;
  #services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090; #(If the vfs0090 Driver does not work, use the following driver)
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
  nix.nixPath = [ "nixos-config=$HOME/dotfiles/" ];
}

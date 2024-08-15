{pkgs,...}:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
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
 #  "video=vesafb:off,efifb:off"
  ];
  boot.loader.systemd-boot.enable = true;
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.fwupd.enable = true;
  hardware.graphics.enable = true;
}

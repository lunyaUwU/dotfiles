{...}:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
#boot.initrd.kernelModules = [
#  "vfio_pci"
#  "vfio"
#  "vfio_iommu_type1"
#];
#boot.kernelParams = [
#  "iommu=pt"
#  "intel_iommu=on"
#  "vfio.enable_unsafe_noiommu_mode=1" 
#  "vfio-pci.ids=8086:34a,4086:34c8,8086:3482,8086:34a3,086:34a4"
#  "kvm.ignore_msrs=1"
# 
#]; 
# boot.blacklistedKernelModules = ["spi-intel-pci"];
  boot.loader.systemd-boot.enable = true;
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.fwupd.enable = true; 
}


{pkgs,...}:{
specialisation = {
     offloadGPU = {
      inheritParentConfig = true;
      configuration = {
        programs.virt-manager.enable = true;
        virtualisation = {
          libvirtd = {
            enable = true;
            qemu = {
              ovmf.enable = true;
              ovmf.packages = [ pkgs.OVMFFull.fd pkgs.pkgsCross.aarch64-multiplatform.OVMF.fd ];
              runAsRoot = false;
              swtpm.enable = true;
            };
          };
        };
        users.users.luna.packages = with pkgs; [ virtio-win qemu_full quickemu virt-manager libguestfs ];
        boot = {
          initrd.availableKernelModules = [ "pci_stub" "vfio" "vfio-pci" "vfio_iommu_type1" "nouveau" "nvidiafb" ];
          initrd.kernelModules = [ "vfio_pci" "vfio" "nouveau"];
          kernelParams = [
            "intel_iommu=on" "iommu=pt" 
            "vfio-pci.ids=10de:1d16"
            "video=vesafb:off" "video=efifb:off" "video=simplefb:off" "video=vesa:off"
            "rd.driver.pre=vfio-pci" "pcie_acs_override=downstream,multifunction"
            "disable_vga=1"
            ];
          blacklistedKernelModules = ["nvidia" "nouveau"];
        };
      };
    };
   offloadIGPU = {
      inheritParentConfig = true;
      configuration = {
        programs.virt-manager.enable = true;
        virtualisation = {
          libvirtd = {
            enable = true;
            qemu = {
              ovmf.enable = true;
              ovmf.packages = [ pkgs.OVMFFull.fd pkgs.pkgsCross.aarch64-multiplatform.OVMF.fd ];
              runAsRoot = false;
              swtpm.enable = true;
            };
          };
        };
        users.users.luna.packages = with pkgs; [ virtio-win qemu_full quickemu virt-manager libguestfs ];
        boot = {
          initrd.availableKernelModules = [ "pci_stub" "vfio" "vfio-pci" "vfio_iommu_type1" "nouveau" "nvidiafb" ];
          initrd.kernelModules = [ "vfio_pci" "vfio" "nouveau"];
          kernelParams = [
            "i915.enable_guc=0" "i915.enable_gtv=1" "intel_iommu=on" "iommu=pt" 
            "video=vesafb:off" "video=efifb:off" "video=simplefb:off" "video=vesa:off"  
            "rd.driver.pre=vfio-pci" "pcie_acs_override=downstream,multifunction"
            "disable_vga=1"
            ];
          blacklistedKernelModules = ["snd_hda_intel" "snd_hda_codec_hdmi" "i915"];
        };
      };
    };
  };
}


{config,pkgs,...}:
{
  boot = {
    loader.grub = {
      enable = true;
      efiSupport = true;
      #enableCryptodisk = true;
      efiInstallAsRemovable = true;
      useOSProber = true;
      devices = [ 
        "nodev"
      #  "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_M.2_500GB_S414NB0K817707X" 
      ];
      
    };
    initrd.luks.devices = {
      "cryptroot" = {
        #device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_M.2_500GB_S414NB0K817707X";
        preLVM = true; # You may want to set this to false if you need to start a network service first
      };
    };
  };
}
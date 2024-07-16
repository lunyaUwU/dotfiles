{config,pkgs,...}:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


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
      #crypttabExtraOpts = ["fido2-device=auto"];
      "cryptroot" = {
        #device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_M.2_500GB_S414NB0K817707X";
        preLVM = true;
        preOpenCommands = ''
        echo if you found this device please contact 
        echo matrix: @cloe:katze.sh email: chloe@transgender.army fedi: @chloe@transfem.social 
        '';# You may want to set this to false if you need to start a network service first
      };
    };
  };
}

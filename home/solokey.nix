 { config, pkgs, ... }:
{
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };
   security.pam.services = {
     login.u2fAuth = true;
     sudo.u2fAuth = true;
   };
    users.users.luna.packages = with pkgs; [
      solo2-cli   
   ];
    services.udev.extraRules = ''
# NXP LPC55 ROM bootloader (unmodified)
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1fc9", ATTRS{idProduct}=="0021", TAG+="uaccess"
# NXP LPC55 ROM bootloader (with Solo 2 VID:PID)
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="b000", TAG+="uaccess"
# Solo 2
SUBSYSTEM=="tty", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="beee", TAG+="uaccess"
# Solo 2
SUBSYSTEM=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="beee", TAG+="uaccess" 
SUBSYSTEM=="vfio", OWNER="root", GROUP="kvm"  
#SUBSYSTEM=="usb", ATTRS{idVendor}=="194f", ATTRS{idProduct}=="0301", TAG+="uaccess"

ATTR{idVendor}==\"046d\", ATTR{idProduct}==\"c261\", RUN+=\"/run/current-system/sw/bin/usb_modeswitch -c '/etc/usb_modeswitch.d/046dc261'\"
'';

 # https://github.com/solokeys/solo2-cli/blob/main/70-solo2.rules
   services.udev.packages = [
     pkgs.yubikey-personalization
     pkgs.teensy-udev-rules
     (pkgs.writeTextFile {
     name = "wally_udev";
     text = ''
         # NXP LPC55 ROM bootloader (unmodified)\
         SUBSYSTEM=="hidraw"; ATTRS{idVendor}=="1fc9"; ATTRS{idProduct}=="0021", TAG+="uaccess"\
         # NXP LPC55 ROM bootloader (with Solo 2 VID:PID)\
         SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="b000", TAG+="uaccess"\
         # Solo 2\
         SUBSYSTEM=="tty", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="beee", TAG+="uaccess"\
         # Solo 2\
         SUBSYSTEM=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="beee", TAG+="uaccess"\
     '';
     destination = "/etc/udev/rules.d/70-solo2.rules";
     })
  ];
  }



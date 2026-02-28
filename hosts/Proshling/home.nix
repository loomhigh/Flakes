{ pkgs, ... }:

{
 home.stateVersion = "26.05";

#imports = [ <plasma-manager/modules> ];

programs.plasma = {
  enable = true;
  kscreenlocker.appearance = {
  wallpaper = "/etc/nixos/hosts/Proshling/configs/Wallpapers/grub.jpg";
  };
  powerdevil = {
    AC.turnOffDisplay.idleTimeout = 6000;
    AC.turnOffDisplay.idleTimeoutWhenLocked = 600;
    battery.autoSuspend.idleTimeout = 3000;
  };
  # disable lockscreen
      kscreenlockerrc = {
      Daemon.Autolock = false;
    };
  desktop = {

    # df00bdff
  };
  workspace = {
    wallpaper = "/etc/nixos/hosts/Proshling/configs/Wallpapers/background.png";
    colorScheme = "HannahMontana";
    splashScreen.theme = "GangsterEdition";
    soundTheme = "Proshygen";
    iconTheme = "HML_Icons";
  };  
};

}
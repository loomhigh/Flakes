{ pkgs, ... }:

{
 home.stateVersion = "26.05";

#imports = [ <plasma-manager/modules> ];

programs.plasma = {
  enable = true;
  kscreenlocker.appearance = {
  wallpaper = "/etc/nixos/hosts/Proshling/configs/Wallpapers/grub.jpg";
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
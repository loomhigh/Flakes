{ pkgs, ... }:

{
 home.stateVersion = "26.05";

#imports = [ <plasma-manager/modules> ];

programs.plasma = {
  enable = true;
  desktop = {


  };
  workspace = {
    wallpaper = "/etc/nixos/hosts/Proshling/configs/Wallpapers/background.png";
    colorScheme = "HannahMontana";
    splashScreen.theme = "GangsterEdition";
    soundTheme = "Proshygen";
  };  
};

}
{ pkgs, ... }:

{
 home.stateVersion = "26.05";

#imports = [ <plasma-manager/modules> ];

programs.plasma = {
    enable = true;
  
  home.username = "Proshling";
  home.homeDirectory = "/home/proshling";

  workspace = {
    wallpaper = ./background.jpg;
    #lookAndFeel = "Plasma-Overdose";
  };  
};

}
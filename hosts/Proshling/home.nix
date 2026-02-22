{ pkgs, ... }:

{
 home.stateVersion = "26.05";

#imports = [ <plasma-manager/modules> ];

programs.plasma = {
    enable = true;

  workspace = {
    wallpaper = ./background.jpg;
    #lookAndFeel = "Plasma-Overdose";
  };  
};

}
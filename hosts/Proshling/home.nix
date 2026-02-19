{ pkgs, ... }:

{
 home.stateVersion = "23.11";

#imports = [ <plasma-manager/modules> ];

programs.plasma = {
    enable = true;

  workspace = {
    wallpaper = "/etc/nixos/hosts/Proshling/background.jpg";
    lookAndFeel = "Plasma-Overdose";
  };  
};

}
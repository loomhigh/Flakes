{ pkgs, home-manager, plasma-manager, ... }:
{


programs.plasma = {
    enable = true;

  workspace = {
    wallpaper = "/etc/nixos/hosts/Proshling/background.jpg";
    lookAndFeel = "Plasma-Overdose";
  };  
};

}
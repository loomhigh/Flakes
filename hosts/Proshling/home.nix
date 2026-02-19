{ pkgs, ... }:
{
programs.plasma = {
    enable = true;

  workspace = {
    wallpaper = "/etc/nixos/hosts/Proshling/background.jpg";
    lookAndFeel = "Plasma-Overdose";
  };  };

}
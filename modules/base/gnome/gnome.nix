{config, pkgs, lib, ...}:

{
   # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    totem
    geary
    gnome-tour
    gnome-maps
    gnome-music
    gnome-mines
    gnome-chess
    gnome-sudoku
    gnome-robots
    gnome-weather
  ];
  
  programs.dconf.enable = true;
  programs.dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "blue";
    };
    "org/gnome/desktop/background" = {
      #color-shading-type = "solid";
      picture-uri = "file:///etc/nixos/Profiles/Campaigner/background.jpg";
      #picture-uri = "file:///home/truebeliever/Documents/background.jpg";
    };
  };
}
{config, pkgs, lib, ...}:

{
  
  dconf.enable = true;
  dconf.settings = {
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
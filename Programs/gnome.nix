{config, pkgs, lib, ...}:

{
  
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "red";
    };
  };
}
{config, pkgs, lib, ...}:

{
  
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "blue";
    };
    "/org/gnome/desktop/background" = {
      picture-uri = "/etc/nixos/Profiles/Campaigner/background.jpg";
    };
  };
}
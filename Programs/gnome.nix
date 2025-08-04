{config, pkgs, ...}:

{
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "red";
    };
  };
}
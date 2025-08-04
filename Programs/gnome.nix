{config, pkgs, lib, ...}:

{
   # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  home.packages = with pkgs; [

    gnome-tweaks # a way of messing with the settings of gnome better

  ];
  
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "red";
    };
  };
}
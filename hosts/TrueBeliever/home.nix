 { config, pkgs, lib, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "truebeliever";
  home.homeDirectory = "/home/truebeliever";

  # User packages
  home.packages = with pkgs; [
   fastfetch
  
  
  ];
  home.stateVersion = "25.05";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

# Gnome customizations
#dconf.enable = true;
dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "blue";
    };
    "org/gnome/desktop/background" = {
      #color-shading-type = "solid";
      picture-uri = "file:///etc/nixos/hosts/Campaigner/background.jpg";
    };
  };

}
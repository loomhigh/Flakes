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

  programs = {
  firefox.enable = true;
  fish.enable = true;
  };
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

# Gnome customizations
dconf.enable = true;
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
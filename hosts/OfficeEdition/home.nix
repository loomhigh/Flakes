
{ config, pkgs, inputs, ... }:
{
    imports = [
    ../../Programs/gnome.nix

  ];
  
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "officeedition";
  home.homeDirectory = "/home/officeedition";
  
  # User packages
  home.packages = with pkgs; [
   fastfetch
  
  ];
 home.packages = with pkgs; [
  btop # System monitor you can run in Terminal, I love this thing
  git # Main way of updating the software
  nh # I genuinely cannot remember what this does
  micro # Like the nano text editor, but a little more advamced
  gnome-tweaks # a way of messing with the settings of gnome better
  #luanti # FOSS minecraft-like game, cannot remember why I put this here originally, also, nixos doesn't believe it exists anyway
  systemd #does background tasks. Mainly installed to update the device
  openttd #video game I am using to test whether the updating works
  ];
  
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

}

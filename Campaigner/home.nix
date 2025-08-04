{ config, pkgs, ... }:
{
 home.packages = with pkgs; [
  btop # System monitor you can run in Terminal, I love this thing
  git # Main way of updating the software
  nh # I genuinely cannot remember what this does
  micro # Like the nano text editor, but a little more advamced
  systemd #does background tasks. Mainly installed to update the device
  openttd #video game I am using to test whether the updating works
  kitty #cute terminal
  fish # update this comment when I get it working
  luakit
  feh
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

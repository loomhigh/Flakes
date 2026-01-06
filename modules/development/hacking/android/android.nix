{config, pkgs, lib, ...}:

# all programs used to mess with android
{
  environment.systemPackages = with pkgs; [
  universal-android-debloater
  pmbootstrap
  android-tools
  mtkclient # flasher for mtk phones
  ];

}
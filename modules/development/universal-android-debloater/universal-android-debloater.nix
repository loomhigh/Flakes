{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
  universal-android-debloater
  ];


}
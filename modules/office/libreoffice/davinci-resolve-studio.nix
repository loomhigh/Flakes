{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  libreoffice-qt-fresh # QT Fixes a plasma bug and fresh just means latest stable version
  ];

}
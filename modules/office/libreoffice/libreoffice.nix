{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  libreoffice-qt-fresh # QT Fixes a plasma bug and fresh just means latest stable version
  jre_minimal # Java Runtime Environment so libreoffice base will work
  ];

}
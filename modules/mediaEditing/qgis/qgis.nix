{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  qgis
    (python3.withPackages (python-pkgs: with python-pkgs; [
      pyproj
      pyqt5
  ]))
  ];

}
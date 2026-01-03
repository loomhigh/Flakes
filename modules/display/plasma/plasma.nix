{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  #plasma not sorted out yet
  kdePackages.ffmpegthumbs
  ];

}
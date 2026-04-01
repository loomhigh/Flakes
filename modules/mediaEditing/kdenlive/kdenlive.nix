{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  kdePackages.kdenlive
  ];

}
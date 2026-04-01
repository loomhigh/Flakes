{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  handbrkdePackages.kdenliveake
  ];

}
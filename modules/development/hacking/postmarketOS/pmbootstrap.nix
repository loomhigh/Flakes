{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
  pmbootstrap
  ];


}
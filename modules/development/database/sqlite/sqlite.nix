{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
  sqlite #lightweight Relational Database Management System
  ];


}
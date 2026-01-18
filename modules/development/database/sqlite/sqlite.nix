{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
  sqlite #lightweight Relational Database Management System
  sqlitebrowser # GUI for sqlite databases
  ];


}
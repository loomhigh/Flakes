{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
  #ventoy-full #Currently not allowed due to vulnerabilities according to nixOS
  ];


}
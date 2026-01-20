{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
	lutris
	wineWowPackages.stable #Wine Edge edition
	winetricks
];

}
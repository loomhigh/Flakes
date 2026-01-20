{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
	lutris
	wineWowPackages.staging #Wine Edge edition
	winetricks
];

}
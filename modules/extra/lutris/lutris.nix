{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
	lutris
	#wine64
	wineWowPackages.stable ##Let Lutris handle windows compatibility tbh
	winetricks
];

}
{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
	lutris
	#wine64
	wineWowPackages.stable ##Let Lutris handle windows compatibility tbh
	winetricks
	driversi686Linux.mesa #Drivers to run bdl2?
];

}
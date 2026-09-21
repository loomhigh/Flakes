{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
	lutris
	#wine64
	wineWow64Packages.stable ##Let Lutris handle windows compatibility tbh
	winetricks
	driversi686Linux.mesa #Drivers to run bdl2?
	mangohud #for benchmarking and crud
];

}
{config, pkgs, lib, ...}:

{

environment.systemPackages = [
	(pkgs.kodi.withPackages (kodiPkgs: with kodiPkgs; [
		youtube
    
	]))
];

}
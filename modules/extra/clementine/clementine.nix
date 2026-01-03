{config, pkgs, lib, ...}:

#Abandoned, too much setup

{

environment.systemPackages = with pkgs; [
	
clementine
spotify # Spotify, MOVE TO NEW FILE WHEN FINISHED
spotdl # for downloading spotify music

];

}
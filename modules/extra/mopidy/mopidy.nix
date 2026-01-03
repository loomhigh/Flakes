{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
mopidy
mopidy-mpd
mopidy-ytmusic
mopidy-spotify
ncmpcpp

];

}
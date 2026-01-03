{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
mopidy
mopidy-ytmusic
mopidy-spotify

];

}
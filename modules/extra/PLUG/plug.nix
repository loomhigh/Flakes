{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
sshpass
ansible #unstable is the only one that seems to have a version passt 2.2

python313 # Python3
python313Packages.dateutils #added for PLUG
python313Packages.ical
python313Packages.icalendar 
];

}
{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
sshpass
ansible #unstable is the only one that seems to have a version passt 2.2

];

}
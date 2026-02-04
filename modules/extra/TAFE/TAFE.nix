{config, pkgs, lib, ...}:

{

environment.systemPackages = with pkgs; [
	
vmware-workstation #virtual machine manager required by TAFE


];

}
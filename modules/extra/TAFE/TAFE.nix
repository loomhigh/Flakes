{config, pkgs, lib, ...}:

{
virtualisation.vmware.host.enable = true;
environment.systemPackages = with pkgs; [
	
vmware-workstation #virtual machine manager required by TAFE
open-vm-tools

];

}
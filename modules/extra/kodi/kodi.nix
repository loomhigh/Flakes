{config, pkgs, lib, ...}:

{

environment.systemPackages = [
	(pkgs.kodi.withPackages (kodiPkgs: with kodiPkgs; [
		youtube
	]))
];

system.activationScripts.lutriskodi = {
	text = ''
wget -T 5 -P /home/Entertainer-nc https://github.com/solbero/repository.solbero.matrix/raw/master/repository.solbero.matrix/repository.solbero.matrix.zip
'';
}
 # need to figure out how to get this file downloaded 
 # https://github.com/solbero/repository.solbero.matrix/raw/master/repository.solbero.matrix/repository.solbero.matrix.zip

}
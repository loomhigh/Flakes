{config, pkgs, lib, ...}:

let

pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/cf8cc1201be8bc71b7cbbbdaf349b22f4f99c7ae.tar.gz") {};
in pkgs.mkShell {
  
packages = [
    
(pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      
# select Python packages here
      pandas
      requests
    
]))
  
];
}

{

environment.systemPackages = with pkgs; [
	
sshpass
ansible #unstable is the only one that seems to have a version passt 2.2

  (python3.withPackages (python-pkgs: [
      python-pkgs.uv
      python-pkgs.dateutils
      python-pkgs.icalendar
      python-pkgs.ical
      python-pkgs.markdown
      python-pkgs.soupsieve #BeautifulSoup, converts html to txt
      python-pkgs.beautifulsoup4
  ]))
#python313 # Python3
python313Packages.dateutils #added for PLUG
python313Packages.ical #
python313Packages.icalendar
];

}
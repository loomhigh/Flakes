{config, pkgs, lib, ...}:

{

pkgs.python35.buildEnv.override = {
extraLibs = with pkgs.python35Packages; [ numpy toolz ];
}.env;

environment.systemPackages = with pkgs; [  
#uv
sshpass
ansible #unstable is the only one that seems to have a version passt 2.2
/*
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
*/
];

}
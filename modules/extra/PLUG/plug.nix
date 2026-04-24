{config, pkgs, lib, ...}:

let
  pkgs = import python3 {};
in pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      dateutils
      icalendar
      ical
      markdown
      soupsieve #BeautifulSoup, converts html to txt
      beautifulsoup4
    ]))
  ];
}

{

environment.systemPackages = with pkgs; [
	
sshpass
ansible #unstable is the only one that seems to have a version passt 2.2

  (python3.withPackages (python-pkgs: with python-pkgs; [
      dateutils
      icalendar
      ical
      markdown
      soupsieve #BeautifulSoup, converts html to txt
      beautifulsoup4
  ]))
#python313 # Python3
#python313Packages.dateutils #added for PLUG
#python313Packages.ical #
#python313Packages.icalendar
];

}
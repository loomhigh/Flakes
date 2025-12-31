{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  libreoffice-fresh # fresh just means latest stable version
  hunspell # For spellcheck
  hunspellDicts.en_AU # Aussie spellings
  jdk25_headless
  #Can't seem to get libreoffice base to work due to Java Runtime Issues
  ];

}
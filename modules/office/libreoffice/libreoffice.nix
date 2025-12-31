{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  libreoffice-fresh # fresh just means latest stable version
  hunspell # For spellcheck
  hunspellDicts.en_AU # Aussie spellings
  #jdk25_headless
  #haven't tested if libreoffice base can function without jdk25
  # For future reference, if libreoffice base crashes, delete configs with rm -rf ~/.config/libreoffice
  ];

}
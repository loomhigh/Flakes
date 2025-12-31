{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  libreoffice-fresh # fresh just means latest stable version
  hunspell # For spellcheck
  hunspellDicts.en_AU # Aussie spellings
  javaPackages.compiler.openjdk25 # Java so libreoffice base will work
  ];

}
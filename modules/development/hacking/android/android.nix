{config, pkgs, lib, ...}:

# all programs used to mess with android
{
  environment.systemPackages = with pkgs; [
  universal-android-debloater
  # pmbootstrap #outdated, need to install manually
  android-tools
  mtkclient # flasher for mtk phones
  uv
  ];

}
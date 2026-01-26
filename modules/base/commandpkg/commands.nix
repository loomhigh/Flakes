{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  wget
  usbutils
  yt-dlp
  lshw
  pciutils
  ];

}
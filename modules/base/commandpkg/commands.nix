{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  wget
  usbutils
  yt-dlp

# Read Hardware info like GPUs and stuff
  inxi
  lshw 
  pciutils
  virtualgl # contains glxinfo
  ];

}
{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  wget
  usbutils
  yt-dlp # to download youtube videos
  deno # goes with yt-dlp
  traceroute #allows you to see where your pings travel through
  unzip #allows me to use the unzip and zip command

# Read Hardware info like GPUs and stuff
  inxi
  lshw 
  pciutils
  virtualgl # contains glxinfo
  
  ];

}
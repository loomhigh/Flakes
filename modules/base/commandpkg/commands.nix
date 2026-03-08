{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  wget
  usbutils
  yt-dlp # to download youtube videos
  deno # goes with yt-dlp
  traceroute #allows you to see where your pings travel through
  unzip #allows me to use the unzip and zip command
  nix-index #includes nix-locate command
# Read Hardware info like GPUs and stuff
  inxi
  lshw 
  pciutils
  virtualgl # contains glxinfo
  bulky # bulk rename utility
  nmap #good for finding local IP addresses
  #python314 # Python3
  python314Packages.types-dateutil 
  python314Packages.icalendar
  ];

}
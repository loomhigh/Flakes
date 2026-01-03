{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  yt-dlp
  ];

}
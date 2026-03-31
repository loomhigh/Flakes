{config, pkgs, ...}:
## enables syncling and mounting of cloud storage like Google Drive

## NOT SET UP
{
  environment.systemPackages = [
    pkgs.rclone
  ];


}


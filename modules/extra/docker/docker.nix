{config, pkgs, lib, ...}:

{

  environment.systemPackages = with pkgs; [
    docker
    monica
  ];

  services.monica = {
    enable = true;
    hostname = "monica.campaigndecentral.ch";
    appURL = "localhost:8080";
    appKeyFile = "/etc/nixos/hosts/modules/extra/docker/appkeyidk";
  };
}
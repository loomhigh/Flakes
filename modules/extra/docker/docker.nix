{config, pkgs, lib, ...}:

{

  environment.systemPackages = with pkgs; [
    docker
    monica
  ];

  services.monica = {
    enable = true;
    #hostname = "monica.campaigndecentral.ch";
    #appURL = "localhost:8080";
    #appKeyFile = "/var/lib/monica/app-key";
  };
}
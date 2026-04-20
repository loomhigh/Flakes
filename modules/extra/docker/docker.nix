{config, pkgs, lib, ...}:

{

  environment.systemPackages = with pkgs; [
    docker
    monica
  ];

  services.monica = {
    enable = true;
    appKeyFile = "/etc/nixos/modules/extra/docker/appkeyidk";

    nginx.listen = [ { 
      addr = "127.0.0.1"; 
      port = port; 
      ssl = false; } ];
  };
}
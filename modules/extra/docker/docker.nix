{config, pkgs, lib, ...}:

{

  environment.systemPackages = with pkgs; [
    docker
    monica
  ];
  services.nginx = {
    enable=true;
  };
  services.monica = {
    enable = true;
    database.createLocally = true;
   # appKeyFile = "/etc/nixos/modules/extra/docker/appkeyidk";
  
  nginx = { 
    forceSSL = true;
    enableACME = true;
    listen = [ { 
      addr = "127.0.0.1"; 
      #port = 8000; 
      ssl = false; } ];
  };
}
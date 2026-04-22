{config, pkgs, lib, ...}:

{

  environment.systemPackages = with pkgs; [
    docker
    monica
  ];
  #/*
  services.nginx = {
    enable=true;
  };
  #*/
  services.monica = {
    enable = true;
    database.createLocally = true;
    dataDir = "/var/lib/monica";
    maxUploadSize = "2G";
    appKeyFile = "/etc/nixos/modules/extra/docker/appkeyidk";
    appURL = "https://127.0.0.1:8000";
    config = {
      APP_DEBUG=true;
      APP_ENV=lib.mkForce "local";
      APP_URL=https://127.0.0.1:8000;
      
      #Database Test
      #DB_DATABASE=lib.mkForce "/home/personal/Documents/monica";

    };


  nginx = { 
  #/*
    locations = {
    "/storage/app/public/" = {
    };
  };
  #*/
    forceSSL = true;
    root = "/var/lib/monica";
    kTLS = true;
    sslCertificate = "/etc/nixos/modules/extra/docker/cert.pem";
    sslCertificateKey = "/etc/nixos/modules/extra/docker/key.pem";
    sslTrustedCertificate = "/etc/nixos/modules/extra/docker/cert.pem";
    listen = [ { 
      addr = "localhost"; 
      port = 8000;
      ssl = true; 
    } ];
    
    
   };

  };
}
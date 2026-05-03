{config, pkgs, lib, ...}:

{

  environment.systemPackages = with pkgs; [
    docker
    #monica
  ];

virtualisation.docker = {
  enable = true;
};

  # ATTEMPTED TO USE MONICA. HAD MANY ISSUES. GIVING UP
  services.nginx = {
    enable=true;
  };
  
  services.monica = {
    enable = true;
    database.createLocally = true;
    dataDir = "/home/personal/monica";
    maxUploadSize = "2G";
    appKeyFile = "/etc/nixos/modules/extra/docker/appkeyidk";
    appURL = "https://127.0.0.1:8000";
    config = {
      APP_DEBUG=true;
      #APP_ENV=lib.mkForce "local";
      #Database Test
      DB_DATABASE=lib.mkForce "/home/personal/monica";
    };


  nginx = { 
  #/*
locations = {
    "/" = {
      index = "index.php";
      tryFiles = "$uri $uri/ /index.php?$query_string";
    };
  #   "/store/photos/*" = {
  #    tryFiles = "$uri =404";
  #  };

  };

    forceSSL = true;
    root = lib.mkForce "/var/lib/monica/public";
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
  #*/
}
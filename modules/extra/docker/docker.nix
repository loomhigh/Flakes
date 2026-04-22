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
    appURL = "https://localhost:8000";
  /*
  nginx = { 
    locations = {
    "~ \\.(js|css|gif|png|ico|jpg|jpeg)$" = {
      extraConfig = "expires 365d;";
    };
  #*/
  };
    forceSSL = true;
    root = "/var/lib/monica";
    kTLS = true;
    sslCertificate = "/etc/nixos/modules/extra/docker/cert.pem";
    sslCertificateKey = "/etc/nixos/modules/extra/docker/key.pem";
    sslTrustedCertificate = "/etc/nixos/modules/extra/docker/cert.pem";
    listen = [ { 
      addr = "127.0.0.1"; 
      port = 8000;
      ssl = true; 
    } ];
    
    
   };

  };
}
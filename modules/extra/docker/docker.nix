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
      DB_CONNECTION="sqlite";
      DB_HOST=127.0.0.1;
      DB_PORT=3306;
      DB_DATABASE=/home/personal/Documents/monica;

# Database for SQLite - used for local development
      DB_TEST_DRIVER="sqlite";
      #DB_TEST_DATABASE=full_path_to_the_sqlite_database;
      DB_TEST_HOST=127.0.0.2;
      DB_TEST_USERNAME="root";
      DB_TEST_PASSWORD="root";

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
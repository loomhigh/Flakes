{config, pkgs, lib, ...}:

{

  environment.systemPackages = with pkgs; [
    docker
    monica
  ];
  /*
  services.nginx = {
    enable=true;
  };
*/
  services.monica = {
    enable = true;
    database.createLocally = true;
    #dataDir = "/home/personal/Documents/monica";
    maxUploadSize = "2G";
    appKeyFile = "/etc/nixos/modules/extra/docker/appkeyidk";
    appURL = "https://127.0.0.1:8000";
  
  /*
  nginx = { 
    forceSSL = true;
    root = "/var/lib/monica";
    services.monica.nginx.kTLS = true;
    #serverName = "https://localhost:8000/";
    #enableACME = true; #IDK what this is
    sslCertificate = "/etc/nixos/modules/extra/docker/cert.pem";
    sslCertificateKey = "/etc/nixos/modules/extra/docker/key.pem";
    sslTrustedCertificate = "/etc/nixos/modules/extra/docker/cert.pem";
    listen = [ { 
      addr = "127.0.0.1"; 
      port = 8000;
      ssl = true; 
    } ];
    
   };
   */
  };
}
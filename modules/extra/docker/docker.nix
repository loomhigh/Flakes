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
    appKeyFile = "/etc/nixos/modules/extra/docker/appkeyidk";
    appURL = "https://127.0.0.1:8000";
  nginx = { 
    forceSSL = true;
    sslCertificate = "/etc/nixos/modules/extra/docker/cert.pem";
    sslCertificateKey = "/etc/nixos/modules/extra/docker/key.pem";
    sslTrustedCertificate = "/etc/nixos/modules/extra/docker/cert.pem";
    listen = [ { 
      addr = "127.0.0.1"; 
      port = 8000; 
      ssl = true; } ];
   };
  };
}
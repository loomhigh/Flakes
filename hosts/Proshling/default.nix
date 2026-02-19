{ config, ... }:

{
  imports = [
    ./configuration.nix
    ./home.nix
  ];
}
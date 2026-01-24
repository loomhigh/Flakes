# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, lib, inputs, ...}:

{
  imports = [
  ./../../modules/locale.nix
  ./../../modules/core/default.nix
  ./../../modules/display/plasma/plasma.nix
  ./../../modules/mediaEditing/default.nix
  ./../../modules/office/default.nix
  ./../../modules/extra/lutris/lutris.nix
  ./../../modules/extra/clementine/clementine.nix
  ./../../modules/base/default.nix
  ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.proshling = {
    isNormalUser = true;
    description = "The Official Operating system of UWA's Prosh!";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
    shell = pkgs.fish;
  };

  #bootloader  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Enable automatic login for the user.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "proshling";


  programs = {
  firefox.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [


  ];
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}

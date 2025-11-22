# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./../../modules/locale.nix
    ./../../modules/core/default.nix
    ./../../modules/extra/kodi/kodi.nix
  ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.entertainer = {
    isNormalUser = true;
    description = "Entertainer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
    shell = pkgs.fish;
  };

  #bootloader  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  services.xserver.enable = true;
  services.displayManager.defaultSession = "none+i3";

# I3 WM
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
    ];
    configFile = ./config;
  };

  #services.xserver.desktopManager.kodi.enable = true;
  services.displayManager.autoLogin.user = "entertainer";
  services.xserver.displayManager.lightdm.greeter.enable = false;

  # Install firefox and set default shell to fish
  users.defaultUserShell = pkgs.fish;
  programs = {

  };



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kodi
    i3
    lutris
    qbittorrent

    #fossGames
    superTuxKart
    luanti
  ];
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}

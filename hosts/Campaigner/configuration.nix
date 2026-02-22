# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./../../modules/locale.nix
    ./../../modules/core/default.nix
    ./../../modules/display/i3wm/i3.nix
  ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.Campaigner = {
    isNormalUser = true;
    description = "Campaigner";
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
  # Commented out until a Desktop Manager is determined
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "Campaigner";

# I3 WM
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
    ];
    configFile = "/etc/nixos/hosts/Campaigner/config";
  };

  # Install firefox and set default shell to fish
  users.defaultUserShell = pkgs.fish;
  programs = {

  };



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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

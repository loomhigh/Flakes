# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, lib, inputs, ...}:

{
  imports = [
  ./../../modules/locale.nix
  ./../../modules/core/default.nix
  ./../../modules/base/gnome/gnome.nix
  ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.officeedition = {
    isNormalUser = true;
    description = "OfficeEdition";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
    shell = pkgs.fish;
  };


  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "officeedition";

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

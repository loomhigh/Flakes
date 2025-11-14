# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./../../modules/locale.nix
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
  
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
   
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3blocks #if you are planning on using i3blocks over i3status
     ];
    };
  };
  # Enable automatic login for the user.
  #services.xserver.displayManager.lightdm.enable = true;
  services.displayManager.defaultSession = "none+i3";
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "entertainer";

  # Install firefox and set default shell to fish
  users.defaultUserShell = pkgs.fish;
  programs = {

  };



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    luanti
    kodi
    i3
    lutris

    #fossGames
    superTuxKart
  ];
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}

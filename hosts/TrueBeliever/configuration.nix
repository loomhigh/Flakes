# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./../../modules/locale.nix
    ./../../modules/base/gnome/gnome.nix
  ];
    
  #bootloader  
  boot.loader.grub.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.truebeliever = {
    isNormalUser = true;
    description = "TrueBeliever";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
    shell = pkgs.fish;
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "truebeliever";

  #make gnome work on older hardware at cost of performance
  environment.sessionVariables = rec {
  GSK_RENDERER = "cairo";
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Install firefox and set default shell to fish
  programs = {
  firefox.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  btop # System monitor you can run in Terminal, I love this thing
  fish # better than bash IMO.
  nh # I genuinely cannot remember what this does
  micro # Like the nano text editor, but a little more advamced
  drawio # good for making flowcharts
  ];
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  
  system.stateVersion = "25.05"; # Did you read the comment?

}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./../../modules/locale.nix
    ./../../modules/base/default.nix
    ./../../modules/core/default.nix
    ./../../modules/extra/kodi/kodi.nix
    ./../../modules/display/i3wm/i3.nix
    ./../../modules/extra/lutris/lutris.nix # includes wine
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
    configFile = "/etc/nixos/hosts/Entertainer/config";
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };

/* IDK what this does, kinda just copypasted it
xdg.terminal-exec = {
  enable = true;
  settings = {
    default = [ "kodi" ];
  };
};
*/
  #services.xserver.desktopManager.kodi.enable = true;
  services.displayManager.autoLogin.user = "entertainer";
  services.xserver.displayManager.lightdm.greeter.enable = false;

  # Install firefox and set default shell to fish
  users.defaultUserShell = pkgs.fish;
  programs = {

  };

  #To enable Dynamic Links
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kodi
    i3
    xfce.thunar

    udiskie
    kdePackages.dolphin
    #kdePackages.qtsvg # Automount for dolphin, removing as was not working
    
    kitty
    #dmenu-rs #for opening apps, stops automatic fullscreen
    #i3status #having this stops automatic fullscreen
    #fossGames
    #luanti
  ];
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}

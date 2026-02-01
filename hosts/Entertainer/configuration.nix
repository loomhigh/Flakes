/*

Woah boy this configuration is messy. the Entertainer Profile is an attempt to create a nixOS configuration of Kodi that is also able to launch Lutris games.
If you use this flake, I am giving fair warning that I have probably made some fixes that are added post-install.
There may also be additions to the configuration that don't work on your machine or break it to smitherines.
Much love.

*/

{config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./../../modules/locale.nix
    ./../../modules/base/default.nix #imports basic utilities I like having in all systems like VLC, and some command utils
    ./../../modules/core/default.nix #adds fish
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
    shell = pkgs.fish; #my favourite 
  };

  #bootloader  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  services.xserver.enable = true;
  services.displayManager.defaultSession = "none+i3"; #bare minimum display manager

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

  #attempt to fix controller
  hardware.xpadneo.enable = true;
  hardware.xone.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Reduntant addition of kodi and I3
    kodi
    i3
    
    #packages of convenience.
    kdePackages.dolphin
    xfce.thunar
    micro

    #Fixing Audio and screensaver. 
    #Pipwire and pulse for the command utilities, and xorg.xset to have a command that turns off screensaver when starting up.
    xorg.xset
    pulseaudio
    pipewire
    
    #used to attempt fixing automount issues
    usermount
    udisks
    udiskie

    #controller profiles
    antimicrox #keyboard controller mapper
    linuxConsoleTools #tools to help deal with joysticks. Also installing xbox controller libraries to WINE in case that fixes it.
    #kdePackages.qtsvg # Automount for dolphin, removing as was not working
    
    kitty
    mangohud #for testing while gaming
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

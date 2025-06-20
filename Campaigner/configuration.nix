# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "truebeliever"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Perth";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  # Enable the X11 windowing system &
  # Enable the i3 Window Manager.
  #services.xserver.displayManager.gdm.enable = true; not sure if needed
 services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
     ];
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.truebeliever = {
    isNormalUser = true;
    description = "TrueBeliever";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    #  thunderbird
    ];

  };

environment.sessionVariables = {
    EDITOR = "micro";
    BROWSER = "firefox";
    TERMINAL = "kitty";
};
  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "truebeliever";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229 
  # might not relevant when not using gnome, but keeping in case it is related to gdm
  #systemd.services."getty@tty1".enable = false;
  #systemd.services."autovt@tty1".enable = false;



  # Install firefox.
  programs = {
  firefox.enable = true;
  fish.enable = true;
  };

# an attempt to make a command that updates the computer on startup 01-06-25
# Currently created, but ignored by system and not active

#environment.etc = {
#UpdateFlake.sh = { #Shell file which can hopefully be used by systemd to run updateflake command
#  text = ''
#  #!/bin/bash
#  exec git -C $HOME/Flakes/ pull origin main && nixos-rebuild switch
#  '';
#   # The UNIX file mode bits, idk what that means, but the stackexchange forum post included it
#  mode = "0440";
#};
#}; using this produces build error: the option environment.etc.updateflake.sh does not exist
services.udev.extraRules = ''
  ACTION=="add", RUN+="${pkgs.bash}/bin/bash -c 'exec git -C $HOME/Flakes/ pull origin main && nixos-rebuild switch'
'';
# systemd.services."updateflake".enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  btop # System monitor you can run in Terminal, I love this thing
  git # Main way of updating the software
  nh # I genuinely cannot remember what this does
  micro # Like the nano text editor, but a little more advamced
  #luanti # FOSS minecraft-like game, cannot remember why I put this here originally, also, nixos doesn't believe it exists anyway
  systemd #does background tasks. Mainly installed to update the device
  openttd #video game I am using to test whether the updating works
  kitty #cute terminal
  fish # update this comment when I get it working
  luakit
  feh
  ];
  
#  shellAliases = {
#   sync-rebuild = "git fetch origin && git reset --hard origin/main && git clean -fd && nixos-rebuild switch --flake .#nixos";
#  };
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

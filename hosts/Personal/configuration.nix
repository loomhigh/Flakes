# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./../../modules/locale.nix # misc configurations
    ./../../modules/core/default.nix #adds fundamental packages
    ./../../modules/base/default.nix #Some basic packages that are good to have
    ./../../modules/display/gnome/gnome.nix #adds gnome
    ./../../modules/mediaEditing/default.nix #adds media editing tools
    ./../../modules/development/default.nix #adds media editing tools
    ./../../modules/extra/vesktop/vesktop.nix #Discord
    ./../../modules/office/default.nix #libreoffice and such
    ./../../modules/extra/fractal/fractal.nix #Matrix Client for Gnome
    # ./../../modules/extra/mopidy/mopidy.nix #basic audio player. Too much work
    ./../../modules/extra/clementine/clementine.nix #Music Playing app that connects to spotify
    ./../../modules/extra/PLUG/plug.nix #for programs relating to the Perth Linux Users Group
  ];

# Hardware Adjustments 
#/*
 # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    #package = config.boot.kernelPackages.nvidiaPackages.stable;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_535; # Older versions
    
    # Prime
    prime = {
		# Make sure to use the correct Bus ID values for your system!
    reverseSync.enable = true;
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:1:0:0";
		# amdgpuBusId = "PCI:54:0:0"; For AMD GPU
	};
  };
  
  #bootloader enabling dual-boot
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      windows = {
        "windows" =
          let
            # To determine the name of the windows boot drive, boot into edk2 first, then run
            # `map -c` to get drive aliases, and try out running `FS1:`, then `ls EFI` to check
            # which alias corresponds to which EFI partition.
            boot-drive = "FS0";
          in
          {
            title = "Windows";
            efiDeviceHandle = boot-drive;
            sortKey = "y_windows";
          };
      };

      edk2-uefi-shell.enable = true;
      edk2-uefi-shell.sortKey = "z_edk2";
    };
  };
  ## END OF HARDWARE STUFF
  #*/


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.personal = {
    isNormalUser = true;
    description = "Personal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    librewolf
    ];
    shell = pkgs.fish;
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "personal";

  # Install firefox and set default shell to fish
  programs = {
  firefox.enable = true;
  };
   # this allows dynamic links apparently
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  btop # System monitor you can run in Terminal, I love this thing
  nh # I genuinely cannot remember what this does
  micro # Like the nano text editor, but a little more advamced
  luanti # FOSS minecraft-like game, cannot remember why I put this here originally, also, nixos doesn't believe it exists anyway
  xow_dongle-firmware #remote control firmware
  ];
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}

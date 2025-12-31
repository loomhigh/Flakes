# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./../../modules/locale.nix # misc configurations
    ./../../modules/core/default.nix #adds fundamental packages
    ./../../modules/display/gnome/gnome.nix #adds gnome
    ./../../modules/mediaEditing/default.nix #adds media editing tools
    ./../../modules/development/default.nix #adds media editing tools
    ./../../modules/extra/vesktop/vesktop.nix #Discord
    ./../../modules/office/default.nix #libreoffice and such
  ];

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.personal = {
    isNormalUser = true;
    description = "Personal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  btop # System monitor you can run in Terminal, I love this thing
  nh # I genuinely cannot remember what this does
  micro # Like the nano text editor, but a little more advamced
  luanti # FOSS minecraft-like game, cannot remember why I put this here originally, also, nixos doesn't believe it exists anyway
  ];
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}

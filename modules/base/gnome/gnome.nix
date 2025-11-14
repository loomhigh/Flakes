{config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
  gnome-tweaks

  gnomeExtensions.blur-my-shell
  gnomeExtensions.gsconnect

  ];

   # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    totem
    geary
    gnome-tour
    gnome-maps
    gnome-music
    gnome-mines
    gnome-chess
    gnome-sudoku
    gnome-robots
    gnome-weather
  ];

# Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  programs.dconf.profiles.user.databases = [
    {
      lockAll = true; # determines overriding
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "red";
          color-scheme = "prefer-dark";
          show-battery-percentage = true;
        };
        "org/gnome/desktop/session" = {
          idle-delay = "uint32 1200";
        };
        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-battery-timeout = "uint32 2700";
          sleep-inactive-ac-timeout = "uint32 7200";
          idle-dim = false;
        };
          "org/gnome/desktop/screensaver" = {
          picture-uri = "/etc/nixos/Campaigner/background.jpg";
        };
          "org/gnome/desktop/background" = {
          picture-uri = "/etc/nixos/Campaigner/background.jpg";
        };

        ## Needs testing
        "org/gnome/shell" = {
        disable-extension-version-validation = true; # can run incompatible shell versions
        disable-user-extensions = false; # Optionally disable user extensions entirely
        enabled-extensions = with pkgs.gnomeExtensions; [
          gsconnect.extensionUuid
          blur-my-shell.extensionUuid
        ];
      };
      };
    }
  ];

}
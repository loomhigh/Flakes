{config, pkgs, lib, self, inputs, host, ...}:

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
  services.xserver.displayManager.gdm.autoSuspend = false;
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true; # determines overriding
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "red";
          color-scheme = "prefer-dark";
          show-battery-percentage = false;
        };
        /* Broken atm apparently
        "org/gnome/desktop/session" = {
          idle-delay = lib.gvariant.mkInt32 1200;
        };
        */
        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-battery-timeout = lib.gvariant.mkInt32 2700;
          sleep-inactive-ac-timeout = lib.gvariant.mkInt32 7200;
          idle-dim = false;
        };
          "org/gnome/desktop/screensaver" = {
          picture-uri = "file://" + ./../../../hosts + "/${host}/" + "Background-light.jpg";
          #picture-uri-dark = "file://" + ./Background-dark.jpg;
          lock-delay = lib.gvariant.mkInt32 1800;
        };
          "org/gnome/desktop/background" = {
          picture-options = "zoom";
          picture-uri = "file://" + ./../../../hosts + "/${host}/" + "Background-light.jpg";
          picture-uri-dark = "file://" + ./../../../hosts + "/${host}/" + "Background-dark.jpg";
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
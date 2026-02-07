{config, pkgs, lib, self, inputs, ...}:

{
#services.xserver.enable = true; #attempting to add xorg option

programs.kdeconnect = {
  enable = true;
  package = pkgs.gnomeExtensions.gsconnect;
};

  environment.systemPackages = with pkgs; [
  gnome-tweaks
  gnome.adwaita-icon-theme
  gnomeExtensions.blur-my-shell
  gnomeExtensions.gsconnect
  gnomeExtensions.system-monitor
  gnomeExtensions.gspotify

  ];

   # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    #orca
    evince
    geary
    #gnome-disk-utility
    #baobab
    epiphany
    gnome-text-editor
    gnome-calculator
    gnome-calendar
    gnome-characters
    #gnome-clocks
    #gnome-console
    gnome-tour
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-weather
    gnome-connections
    simple-scan
    #snapshot
    totem
    showtime
    yelp
    gnome-software
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
  # "file://" informs gnome that you are directing it to a file
  # ./../../../hosts moves the direction of the file three levels above where gnome.nix is located and then to /hosts/
  # "/${config.networking.hostname}/" moves down to the folder with the name of the host in the configuration.nix being used
  # "background-Light.jpg" is the name of the image in that folder.
          picture-uri = "file://" + ./../../../hosts + "/${config.networking.hostName}/" + "Background-light.jpg";
          #picture-uri-dark = "file://" + ./Background-dark.jpg;
          lock-enabled = true;
          lock-delay = lib.gvariant.mkInt32 1800;
        };
          "org/gnome/desktop/background" = {
          picture-options = "zoom";
          picture-uri = "file://" + ./../../../hosts + "/${config.networking.hostName}/" + "Background-light.jpg";
          picture-uri-dark = "file://" + ./../../../hosts + "/${config.networking.hostName}/" + "Background-dark.jpg";
        };

        ## Needs testing
        "org/gnome/shell" = {
        disable-extension-version-validation = true; # can run incompatible shell versions
        disable-user-extensions = false; # Optionally disable user extensions entirely
        enabled-extensions = with pkgs.gnomeExtensions; [
          gsconnect.extensionUuid
          blur-my-shell.extensionUuid
          system-monitor.extensionUuid
          gspotify.extensionUuid
        ];
      #  favourite-apps = [
      #    "['org.gnome.Nautilus.desktop', 'org.gnome.settings.desktop', 'firefox.desktop', 'org.gnome.Console.desktop']"
      #  ];
      };
      };
    }
  ];

}
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
      lockAll = true; # prevents overriding
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "red";
          color-scheme = "prefer dark";
        };
      
        "org/gnome/shell" = {
        disable-extension-version-validation = true;
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
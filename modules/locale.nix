
  {config, pkgs, lib, inputs, ...}:

  {
  hardware.enableAllHardware = true;

  #networking.hostName = "truebeliever"; # Define your hostname.
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

  # this enables flakes, the most common way of managing nixOS
    # flakes differ from the defaul "channels"  method by having package versions stated in configs rather than outside of them
        # This allows you to create a complete time machine of your computers history if you use git
  nix.settings.experimental-features = ["nix-command" "flakes"];
  

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  programs.dconf.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.defaultUserShell = pkgs.fish;
  programs = {
  fish.enable = true;
  };

 nixpkgs.config.allowUnfree = true;

 environment.shellAliases = {
    SyncFlake = "sudo git -C /etc/nixos/ pull";
    NixUpdate = "sudo git -C /etc/nixos/ pull && sudo nixos-rebuild switch";
  };

  # ensure git is always installed
  environment.systemPackages = with pkgs; [
  git # needed to run SynkFlake
  btop # System monitor you can run in Terminal, I love this thing
  fastfetch

  texlivePackages.opensans
  comic-mono
  times-newer-roman
  liberation_ttf_v1

  ];
  }
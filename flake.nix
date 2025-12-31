{
  description = "loomhighs nixOS FLAKE";

## INPUTS ##

# inputs directs where to find package files
  # usually just need to direct it to nixOS's github repo, as shown.
  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    #copy-pasted from nix-community github tutorial on adding home-manager module to flakes
    home-manager.url = "github:nix-community/home-manager"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    #Came with librepheonix's setup, not sure what it does but my setup breaks without it
    chaotic.url = "github:chaotic-cx/nyx";

    #nix4vscode, allows me to use shortcuts to install the right vscodium extensions, not currently in use
    nix4vscode = {
    url = "github:nix-community/nix4vscode";
    inputs.nixpkgs.follows = "nixpkgs";
    };
  };

## /INPUTS ##


##  OUTPUTS ##

outputs = inputs@{ self, ...}:
    let
    # configure lib
      lib = inputs.nixpkgs.lib;
      # create a list of all directories inside of ./hosts
      # every directory in ./hosts has config for that machine
      hosts = builtins.filter (x: x != null) (lib.mapAttrsToList (name: value: if (value == "directory") then name else null) (builtins.readDir ./hosts));
    in {
      # generate a nixos configuration for every host in ./hosts
      nixosConfigurations = builtins.listToAttrs
        (map (host: {
          name = host;
          value = lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              # host specific config
              { config.networking.hostName = host; }
              (./hosts + "/${host}")

              # Hardware Config
              ./hardware-configuration.nix

              # home manager
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager.extraSpecialArgs = {
                  inherit inputs;
                };
              }

              # chaos... control!
              inputs.chaotic.nixosModules.default
            ];
            specialArgs = {
              inherit inputs;
            };
          };
        }) hosts);
    };
}
## /OUTPUTS ##

## USEFUL TO KNOW ##
# to change a system to a specific flake, type the following command
  # `sudo nixos-rebuild switch --flake [DIRECTORY HERE]`
# to use a flake that states a different hostname than the computer you are switching to, use the following:
  # `sudo nixos-rebuild switch --flake PATHTOFILE#NAMEOFCONFIGURATION

### Setting up nixOS flake ###
  # Normal install
  # add git to config
  # delete files from nixos folder and cut the hardware config `sudo rm /etc/nixos/configuration.nix`
  # in nixos directory type `git clone https://github.com/loomhigh/Flakes ./`
  # paste the hardware config file back in and add it to git folder `git add hardware-configuration.nix`
  # nixos-rebuild boot
  # Make sure to specify the right user when doing this command. The "git+file://" error happens because its the wrong user
  # command used: `sudo nixos-rebuild boot --flake /etc/nixos#truebeliever`
  # note, when changing to a new user, make sure to set the password
  # make sure to also git add the hardware config
  # set user password with passwd command
  # Make sure there is a GPT /boot partition when installing nixOS, don't mark boot with the boot flag
### / ###

/*
  ____20251113 - TO-DOs____
  - Module referencing. Make a system that allows you to reference specific modules for each host configuration.
    - Current idea: import modules directly through the config file, idk if thats how you do that, look at a tutorial
    - Alternative Idea: Keep it simple, `./../../` reference the modules by moving up a folder to reach the module folder that needs referencing.
    - Popular third option: toggleable modules. allows more customisation and allowing priority.
  - Cleanup Configs. Config files have a lot of likely reduntant parts, or parts that can be made into a universal config like 
    - locale settings
    - bootloader (might vary from user, don't know yet)
    - fish shell aliases
  
  ____20251114 -  ___
  Managed to set up gnome to my delighful levels. 
  - Figure out how to edit the gnome app menu and favourites
  - clean up systemdboot's menu
  - add windows Dualboot
  - set main filesystem to direct to spare SSD
  
  
  
  */

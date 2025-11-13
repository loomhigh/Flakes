{
  description = "loomhighs nixOS FLAKE";

## INPUTS ##

# inputs directs where to find package files
  # usually just need to direct it to nixOS's github repo, as shown.
  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    #copy-pasted from nix-community github tutorial on adding home-manager module to flakes
    home-manager.url = "github:nix-community/home-manager"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx";
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

              # my modules
              ./modules/base
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
/*
# outputs tell nixOS how to build the system
  # the "self, nixpkgs, ..." allows functions like lib to work
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # nixosConfigurations is where we describe how to find out setup files
      # it uses the function from nixpkgs.lib called "nixosSystem" to do this
        # this function requires two details:
          # `system` which is the cpu architecture we are running the system on
          # `modules` the location of all our .nix files which set the system up 

  

    nixosConfigurations = {
      truebeliever = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
          ./configuration.nix

          #copy-pasted from nix-community github tutorial on adding home-manager module to flakes
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.truebeliever = ./hosts/TrueBeliever/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
      campaigner = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
          ./configuration.nix

          #copy-pasted from nix-community github tutorial on adding home-manager module to flakes
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.truebeliever = ./hosts/Campaigner/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
      personal = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
          ./configuration.nix

          #copy-pasted from nix-community github tutorial on adding home-manager module to flakes
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.truebeliever = ./hosts/Personal/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
    };
  };
}
*/


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
### / ###
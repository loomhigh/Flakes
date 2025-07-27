{
  description = "loomhighs nixOS FLAKE";

## INPUTS ##

# inputs directs where to find package files
  # usually just need to direct it to nixOS's github repo, as shown.
  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

## /INPUTS ##


##  OUTPUTS ##


# outputs tell nixOS how to build the system
  # the "self, nixpkgs, ..." allows functions like lib to work
  outputs = { self, nixpkgs, ... }@inputs: {
    # nixosConfigurations is where we describe how to find out setup files
      # it uses the function from nixpkgs.lib called "nixosSystem" to do this
        # this function requires two details:
          # `system` which is the cpu architecture we are running the system on
          # `modules` the location of all our .nix files which set the system up 
    nixosConfigurations.truebeliever = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        Flakes/configuration.nix
      ];
    };
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
  # in nixos directory type `github clone https://github.com/loomhigh/Flakes`
  # delete default config file `sudo rm /etc/nixos/configuration.nix`
  # link flake file to folder `sudo ln -s /home/truebliever/Flakes/flake.nix /etc/nixos/`
  # nixos-rebuild boot
### / ###
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
  };

## /INPUTS ##


##  OUTPUTS ##


# outputs tell nixOS how to build the system
  # the "self, nixpkgs, ..." allows functions like lib to work
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
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
          ./configuration.nix

          #copy-pasted from nix-community github tutorial on adding home-manager module to flakes
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            #home-manager.users.truebeliever = ./Profiles/TrueBeliever/home.nix;
            #home-manager.users.officeedition = ./Profiles/OfficeEdition/home.nix;
            home-manager.users.campaigner = ./Profiles/Campaigner/home.nix;
            #home-manager.users.personal = ./Profiles/Personal/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
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
  # delete files from nixos folder and cut the hardware config `sudo rm /etc/nixos/configuration.nix`
  # in nixos directory type `git clone https://github.com/loomhigh/Flakes ./`
  # paste the hardware config file back in and add it to git folder `git add hardware-configuration.nix`
  # nixos-rebuild boot
  # NOTE: Doesn't work this way, I think I forgot a step along the way
### / ###
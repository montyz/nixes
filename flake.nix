{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    agenix.url = "github:ryantm/agenix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, agenix, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        nix0 = lib.nixosSystem {
          defaultPackage.${system} = home-manager.defaultPackage.${system};
          modules = [ 
            ./conf.nix 
            agenix.nixosModules.default
            {
                environment.systemPackages = [ 
                    agenix.packages.x86_64-linux.default 
                ];
            }
            {
                age.secrets.nextcloud_admin_pass.file = ./nextcloud_admin_pass.age;
                age.secrets.nextcloud_admin_pass.owner = "nextcloud";
                age.secrets.easydns.file = ./easydns.age;
            }
            ./nextcloud.nix
            ./plex.nix
          ];
      };
    };
    homeConfigurations.monty = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home.nix ];
    };

  };
}
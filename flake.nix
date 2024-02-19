{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, nixpkgs, agenix, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nix0 = lib.nixosSystem {
          programs.kitty.enable = true;

          system = "x86_64-linux";
          modules = [ 
            ./conf.nix 
            agenix.nixosModules.default
            {
                environment.systemPackages = [ 
                    agenix.packages.x86_64-linux.default 
                ];
            }
          ];
      };
    };
  };
}
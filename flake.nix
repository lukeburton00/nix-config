{
  description = "Nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # flake-parts.url = "github:hercules-ci/flake-parts";
    # import-tree.url = "github:vic/import-tree";
    #
    darwin.url = "github:nix-darwin/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
  };

  # outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
  outputs = {
    self,
    nixpkgs,
    darwin,
    home-manager,
    nix-homebrew,
    homebrew-core,
    homebrew-cask,
    nix-flatpak,
    ...
  } @ inputs: let
    username = "luke";
  in {
    darwinConfigurations.consul = darwin.lib.darwinSystem {
      specialArgs = {
        inherit self inputs username;
      };
      modules = [
        ./hosts/consul
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            users.${username} = import ./home/darwin;
          };
        }
      ];
    };
    nixosConfigurations.endymion = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit self inputs username;
      };
      modules = [
        ./hosts/endymion
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            users.${username} = import ./home/nixos;
          };
        }
      ];
    };
  };
}

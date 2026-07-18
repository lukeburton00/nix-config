{
  description = "Nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:nix-darwin/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

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

  outputs = {
    self,
    darwin,
    nixpkgs,
    nix-homebrew,
    homebrew-core,
    homebrew-cask,
    nix-flatpak,
    ...
  } @ inputs: {
    darwinConfigurations = {
      consul = darwin.lib.darwinSystem {
        specialArgs = {
          inherit self inputs;
          username = "luke";
        };
        modules = [
          ./hosts/consul
        ];
      };
    };
    nixosConfigurations = {
      endymion = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit self inputs;
          username = "luke";
        };
        modules = [./hosts/endymion];
      };
    };
  };
}

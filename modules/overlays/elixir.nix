{
  self,
  inputs,
  ...
}: let
  elixirOverlay = self: super: {
    elixir = super.beamPackages.elixir_1_20;
    elixir-ls = super.elixir-ls.override {
      elixir = super.beamPackages.elixir_1_20;
    };
  };
in {
  flake.nixosModules.elixirOverlay = {
    nixpkgs.overlays = [elixirOverlay];
  };

  flake.darwinModules.elixirOverlay = {
    nixpkgs.overlays = [elixirOverlay];
  };
}

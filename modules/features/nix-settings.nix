{
  self,
  inputs,
  ...
}: let
  nixSettings = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    nixpkgs.config.allowUnfree = true;
  };
in {
  flake.nixosModules.nixSettings = nixSettings;
  flake.darwinModules.nixSettings = nixSettings;
}

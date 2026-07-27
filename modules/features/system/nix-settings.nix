{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nixSettings = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nixpkgs.config.allowUnfree = true;
  };

  flake.darwinModules.nixSettings = {
    nix.enable = false;
  };
}

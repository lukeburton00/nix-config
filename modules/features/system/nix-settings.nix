{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.nixSettings = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nixpkgs.config.allowUnfree = true;
  };

  flake.modules.darwin.nixSettings = {
    nix.enable = false;
    nixpkgs.config.allowUnfree = true;
  };
}

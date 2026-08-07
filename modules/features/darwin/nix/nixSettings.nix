{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.nixSettings = {
    nixpkgs.config.allowUnfree = true;

    nix.enable = false; # needed for Determinate Nix to function
  };
}

{
  flake.modules.darwin.nix = {
    config,
    username,
    ...
  }: {
    nixpkgs.config.allowUnfree = true;
    nix.enable = false; # needed for Determinate Nix to function
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nix-ld = {
    programs.nix-ld.enable = true;
  };
}

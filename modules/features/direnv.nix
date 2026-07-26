{
  self,
  inputs,
  ...
}:
let
  direnvConfig = {pkgs, ...}: {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
in {
  flake.nixosModules.direnv = direnvConfig;
  flake.darwinModules.direnv = direnvConfig;
}

{
  self,
  inputs,
  ...
}: let
  direnvConfig = {pkgs, ...}: {
    programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
  };
in {
  flake.nixosModules.direnv = direnvConfig;
  flake.darwinModules.direnv = direnvConfig;
}

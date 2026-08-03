{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-direnv = {pkgs, ...}: {
    programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
  };
}

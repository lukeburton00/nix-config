{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-lazyworktree = {pkgs, ...}: {
    programs.lazyworktree = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

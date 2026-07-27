{
  self,
  inputs,
  ...
}: {
  flake.homeModules.lazyworktree = {
    programs.lazyworktree = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

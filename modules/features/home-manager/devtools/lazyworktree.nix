{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-lazyworktree = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.lazyworktree = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.lazyworktree = {
    lib,
    config,
    ...
  }: {
    options = {
      lazyworktree.enable = lib.mkEnableOption "enables lazyworktree";
    };

    config = lib.mkIf config.lazyworktree.enable {
      programs.lazyworktree = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

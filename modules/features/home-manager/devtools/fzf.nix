{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-fzf = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

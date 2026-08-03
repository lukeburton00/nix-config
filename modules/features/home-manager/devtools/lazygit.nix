{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-lazygit = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.lazygit = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

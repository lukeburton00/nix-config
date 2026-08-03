{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-mise = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.mise = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

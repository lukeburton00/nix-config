{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-zoxide = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

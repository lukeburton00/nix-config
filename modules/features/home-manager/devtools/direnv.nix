{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-direnv = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.direnv = {
    lib,
    config,
    ...
  }: {
    options = {
      direnv.enable = lib.mkEnableOption "enables direnv";
    };

    config = lib.mkIf config.direnv.enable {
      programs.direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

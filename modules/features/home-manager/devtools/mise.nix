{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.mise = {
    lib,
    config,
    ...
  }: {
    options = {
      mise.enable = lib.mkEnableOption "enables mise";
    };

    config = lib.mkIf config.mise.enable {
      programs.mise = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

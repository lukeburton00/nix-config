{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.ripgrep = {
    lib,
    config,
    ...
  }: {
    options = {
      ripgrep.enable = lib.mkEnableOption "enables ripgrep";
    };

    config = lib.mkIf config.ripgrep.enable {
      programs.ripgrep = {
        enable = true;
        arguments = [
          "--hidden"
          "--glob=!.git/*"
        ];
      };
    };
  };
}

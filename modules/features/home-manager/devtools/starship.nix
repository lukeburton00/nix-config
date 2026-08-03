{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.starship = {
    lib,
    config,
    ...
  }: {
    options = {
      starship.enable = lib.mkEnableOption "enables starship";
    };

    config = lib.mkIf config.starship.enable {
      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          aws.disabled = true;
        };
      };
    };
  };
}

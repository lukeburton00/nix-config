{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-starship = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
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

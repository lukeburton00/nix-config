{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.git = {
    lib,
    config,
    ...
  }: {
    options = {
      git.enable = lib.mkEnableOption "enables git";
    };

    config = lib.mkIf config.git.enable {
      programs.git = {
        enable = true;
        settings = {
          user = {
            name = "Luke Burton";
            email = "lukesburton19@gmail.com";
          };
          init.defaultBranch = "main";
        };
      };
    };
  };
}

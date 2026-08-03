{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-git = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
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

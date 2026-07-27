{
  self,
  inputs,
  ...
}: {
  flake.homeModules.git = {
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
}

{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-git = {pkgs, ...}: {
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

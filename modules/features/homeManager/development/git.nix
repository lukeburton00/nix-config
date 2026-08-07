{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
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

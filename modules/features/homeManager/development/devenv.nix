{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
    programs.devenv = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

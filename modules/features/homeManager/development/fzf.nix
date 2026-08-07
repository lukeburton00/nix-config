{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

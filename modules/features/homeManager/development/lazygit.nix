{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
    programs.lazygit = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

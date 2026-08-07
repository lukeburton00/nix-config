{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
    programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
  };
}

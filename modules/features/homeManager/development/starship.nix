{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        aws.disabled = true;
      };
    };
  };
}

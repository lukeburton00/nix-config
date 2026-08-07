{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        mgr = {
          show_hidden = true;
        };
      };
    };
  };
}

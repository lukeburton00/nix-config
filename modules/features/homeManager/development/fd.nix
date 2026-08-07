{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
    programs.fd = {
      enable = true;
      hidden = true;
      ignores = [
        ".git/"
      ];
    };
  };
}

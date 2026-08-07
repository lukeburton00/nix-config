{ self, inputs, ... }: {
  flake.modules.homeManager.development = {
    programs.ripgrep = {
      enable = true;
      arguments = [
        "--hidden"
        "--glob=!.git/*"
      ];
    };
  };
}

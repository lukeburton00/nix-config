{ inputs, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./opts.nix
    ./autocmds.nix
    ./plugins.nix
  ];
  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = true;
      vimAlias = true;
    };
  };
  home.sessionVariables.EDITOR = "nvim";
}

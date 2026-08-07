{ self, inputs, ... }: {
  flake.modules.homeManager.development = { pkgs, ... }: {
    home.packages = with pkgs; [
      neovim

      croc
      stow
      tree
      tree-sitter
      gcc
      tmux-sessionizer

      lua-language-server
      stylua
      nil
      alejandra
      statix
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}

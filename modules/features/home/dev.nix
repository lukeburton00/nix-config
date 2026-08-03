{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev = {pkgs, ...}: {
    imports = [
      self.modules.homeManager.dev-zsh
      self.modules.homeManager.dev-tmux
      self.modules.homeManager.dev-direnv
      self.modules.homeManager.dev-ghostty
      self.modules.homeManager.dev-fd
      self.modules.homeManager.dev-fzf
      self.modules.homeManager.dev-git
      self.modules.homeManager.dev-lazygit
      self.modules.homeManager.dev-lazyworktree
      self.modules.homeManager.dev-mise
      self.modules.homeManager.dev-pi-coding-agent
      self.modules.homeManager.dev-ripgrep
      self.modules.homeManager.dev-starship
      self.modules.homeManager.dev-yazi
      self.modules.homeManager.dev-zoxide
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

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
  };
}

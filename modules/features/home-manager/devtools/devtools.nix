{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.devtools = {
    lib,
    config,
    pkgs,
    ...
  }: {
    imports = [
      self.modules.homeManager.zsh
      self.modules.homeManager.tmux
      self.modules.homeManager.direnv
      self.modules.homeManager.devenv
      self.modules.homeManager.fd
      self.modules.homeManager.fzf
      self.modules.homeManager.git
      self.modules.homeManager.lazygit
      self.modules.homeManager.lazyworktree
      self.modules.homeManager.mise
      self.modules.homeManager.pi-coding-agent
      self.modules.homeManager.ripgrep
      self.modules.homeManager.starship
      self.modules.homeManager.yazi
      self.modules.homeManager.zoxide
    ];

    options = {
      devtools.enable = lib.mkEnableOption "enables development tools";
    };

    config = lib.mkIf config.devtools.enable {
      zsh.enable = lib.mkDefault true;
      tmux.enable = lib.mkDefault true;
      direnv.enable = lib.mkDefault true;
      devenv.enable = lib.mkDefault true;
      fd.enable = lib.mkDefault true;
      fzf.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      lazygit.enable = lib.mkDefault true;
      lazyworktree.enable = lib.mkDefault true;
      mise.enable = lib.mkDefault true;
      pi-coding-agent.enable = lib.mkDefault true;
      ripgrep.enable = lib.mkDefault true;
      starship.enable = lib.mkDefault true;
      yazi.enable = lib.mkDefault true;
      zoxide.enable = lib.mkDefault true;

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
  };
}

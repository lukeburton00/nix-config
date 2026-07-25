{ pkgs, ... }: {
  programs.nvf.settings.vim = {
    extraPlugins.tmux-navigator = {
      package = pkgs.vimPlugins.vim-tmux-navigator;
    };
  };
}

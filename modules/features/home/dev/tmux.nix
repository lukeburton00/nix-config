{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-tmux = {pkgs, ...}: {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      escapeTime = 200;
      mouse = true;
      focusEvents = true;
      shell = "${pkgs.zsh}/bin/zsh";

      plugins = with pkgs.tmuxPlugins; [
        nord
        vim-tmux-navigator
      ];

      extraConfig = ''
        set-option -a terminal-features 'xterm-256color:RGB'

        set -g status on
        set -g status-interval 1

        set -g status-position bottom

        bind-key -n C-M-n switch-client -n
        bind-key -n C-M-p switch-client -p
      '';
    };
  };
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    tmux-sessionizer
  ];

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 200;
    mouse = true;
    focusEvents = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
    extraConfig = ''
      set-option -a terminal-features 'xterm-256color:RGB'

      set -g status on
      set -g status-interval 1

      set -g status-position bottom
      set -g status-justify right
      set -g status-style "fg=white,bg=default"

      set -g status-left-length 140
      set -g status-left "#[fg=white,bg=default] #S #{prefix_highlight}"

      set -g status-right-length 140
      set -g status-right ""

      set -g message-style "fg=black,bg=cyan"

      set -g pane-border-style fg=black
      set -g pane-active-border-style "bg=default fg=black"

      setw -g window-status-separator " \~ "
      setw -g window-status-format "#[fg=white,bg=default] #W "
      setw -g window-status-current-format "#[fg=yellow,bg=default] #W "

      bind-key -n C-M-n switch-client -n
      bind-key -n C-M-p switch-client -p
    '';
  };
}

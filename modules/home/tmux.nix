{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    prefix = "C-b";
    escapeTime = 200;
    baseIndex = 1;
    historyLimit = 5000;

    extraConfig = ''
      # proper color support for neovim etc.
      set-option -a terminal-features 'xterm-256color:RGB'

      set -g focus-events on

      # reload config
      bind r source-file ~/.config/tmux/tmux.conf

      # Smart pane switching with awareness of Vim splits.
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'
      bind-key -n 'C-\' if-shell "$is_vim" 'send-keys C-\\' 'select-pane -l'
      bind-key -n 'C-Space' if-shell "$is_vim" 'send-keys C-Space' 'select-pane -t:.+'

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l
      bind-key -T copy-mode-vi 'C-Space' select-pane -t:.+

      bind-key -n C-M-n switch-client -n
      bind-key -n C-M-p switch-client -p

      # status bar
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
    '';
  };
}

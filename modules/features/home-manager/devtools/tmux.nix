{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.tmux = {
    lib,
    config,
    pkgs,
    ...
  }: {
    options = {
      tmux.enable = lib.mkEnableOption "enables tmux";
    };

    config = lib.mkIf config.tmux.enable {
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
  };
}

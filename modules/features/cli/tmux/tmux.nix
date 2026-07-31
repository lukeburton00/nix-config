{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.tmux = {pkgs, ...}: {
    home.packages = with pkgs; [
      tmux-sessionizer
    ];

    programs.tmux = {
      enable = true;
      baseIndex = 1;
      escapeTime = 200;
      mouse = true;
      focusEvents = true;
      shell = "${pkgs.zsh}/bin/zsh";

      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
      ];

      extraConfig = builtins.readFile ./tmux.conf;
    };
  };
}

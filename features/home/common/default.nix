{pkgs, ...}:{
  imports = [
    ../git
    ../ghostty
    ../starship
    ../mise
    ../tmux
    ../yazi
    ../ripgrep
    ../zoxide
    ../zsh
    ../lazyworktree
    ../nvim
    ../tools
  ];

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tree
  ];
}

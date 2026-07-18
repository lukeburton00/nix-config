{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    btop
    fastfetch
    fd
    fzf
    git
    ripgrep
    starship
    stow
    tmux
    unzip
    yazi
    zoxide
  ];
}

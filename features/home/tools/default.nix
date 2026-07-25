{pkgs, ...}: {
  home.packages = with pkgs; [
    btop
    fastfetch
    fd
    fzf
    stow
    unzip
    cmake
    gcc
    gnumake
    lazygit
    opencode
    rustup
    tree-sitter
    tree
  ];
}

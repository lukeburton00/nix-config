{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    cmake
    lazygit
    neovim
    opencode
    rustup
    tree-sitter
  ];
}

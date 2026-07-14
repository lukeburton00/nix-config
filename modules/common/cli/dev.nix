{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lazygit
    neovim
    opencode
    rustup
    tree-sitter
  ];
}

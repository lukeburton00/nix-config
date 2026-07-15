{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cmake
    gcc
    gnumake
    lazygit
    mise
    neovim
    opencode
    rustup
    tree-sitter
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}

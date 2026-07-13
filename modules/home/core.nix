{
  imports = [
    ./git.nix
    ./tmux.nix
    ./nvim.nix
  ];
  programs = {
    btop.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    zoxide.enable = true;
  };
}

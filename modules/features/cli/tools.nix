{
  self,
  inputs,
  ...
}: {
  flake.homeModules.tools = {pkgs, ...}: {
    home.packages = with pkgs; [
      btop
      fastfetch
      fd
      fzf
      stow
      unzip
      lazygit
      opencode
      tree
    ];
  };
}

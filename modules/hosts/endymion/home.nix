{
  self,
  inputs,
  ...
}: {
  flake.homeModules.luke = {pkgs, ...}: {
    imports = [
      self.homeModules.ghostty
      self.homeModules.git
      self.homeModules.starship
      self.homeModules.mise
      self.homeModules.tmux
      self.homeModules.yazi
      self.homeModules.ripgrep
      self.homeModules.zoxide
      self.homeModules.zsh
      self.homeModules.lazyworktree
      self.homeModules.nvim
      self.homeModules.tools
      self.homeModules.sway
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };
}

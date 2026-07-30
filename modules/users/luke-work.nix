{
  self,
  inputs,
  ...
}: {
  flake.homeModules.lukeWork = {pkgs, ...}: {
    imports = [
      self.homeModules.zsh
      self.homeModules.nvim
      self.homeModules.tools
      self.homeModules.starship
      self.homeModules.yazi
      self.homeModules.zoxide
      self.homeModules.tmux
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
    home.homeDirectory = "/Users/lukeburton";
  };

  flake.modules.darwin.lukeWork = {
    system.primaryUser = "lukeburton";
    home-manager.users.lukeburton = self.homeModules.lukeWork;
    users.users.lukeburton.home = "/Users/lukeburton";
  };
}

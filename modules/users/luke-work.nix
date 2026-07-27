{
  self,
  inputs,
  ...
}: {
  flake.homeModules.lukeWork = {pkgs, ...}: {
    imports = [
      self.homeModules.nvim
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
    home.homeDirectory = "/Users/lukeburton";
  };

  flake.darwinModules.lukeWork = {
    system.primaryUser = "lukeburton";
    home-manager.users.lukeburton = self.homeModules.lukeWork;
    users.users.lukeburton.home = "/Users/lukeburton";
  };
}

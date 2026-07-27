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
  };

  flake.darwinModules.lukeWork = {
    home-manager.users.lukeburton = self.homeModules.lukeWork;
  };
}

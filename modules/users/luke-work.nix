{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.lukeWork = {pkgs, ...}: {
    imports = [
      self.modules.homeManager.devtools
      self.modules.homeManager.workTools
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
    home.homeDirectory = "/Users/lukeburton";
  };

  flake.modules.darwin.lukeWork = {
    imports = [
      self.modules.darwin.workTools
    ];
    system.primaryUser = "lukeburton";
    home-manager.users.lukeburton = self.modules.homeManager.lukeWork;
    users.users.lukeburton.home = "/Users/lukeburton";
  };
}

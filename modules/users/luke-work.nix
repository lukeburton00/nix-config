{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.lukeburton = {pkgs, ...}: {
    imports = [
      self.modules.homeManager.devtools
      self.modules.homeManager.workTools
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
    home.homeDirectory = "/Users/lukeburton";
  };

  flake.modules.darwin.lukeburton = {
    system.primaryUser = "lukeburton";
    home-manager.users.lukeburton = self.modules.homeManager.lukeburton;
    users.users.lukeburton.home = "/Users/lukeburton";
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.lukeburton = {pkgs, ...}: {
    imports = [
      self.modules.homeManager.dev
      self.modules.homeManager.work-tools
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
    home.homeDirectory = "/Users/lukeburton";
  };
}

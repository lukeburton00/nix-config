{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.luke = {pkgs, ...}: {
    imports = [
      self.modules.homeManager.dev
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };
}

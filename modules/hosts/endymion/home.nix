{
  self,
  inputs,
  ...
}: {
  flake.homeModules.luke = {pkgs, ...}: {
    imports = [
      self.homeModules.ghostty
    ];
    home.stateVersion = "26.05";
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.darwinModules.work-laptopConfiguration = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.darwinModules.work-laptopHardware
      self.darwinModules.homeManager
      self.darwinModules.ghostty
      self.darwinModules.tailscale
      self.darwinModules.nixSettings
      self.darwinModules.direnv
      self.darwinModules.locale
      self.darwinModules.homebrew
      self.darwinModules.librewolf
      self.darwinModules.lukeWork
    ];

    system.stateVersion = 6;
  };
}

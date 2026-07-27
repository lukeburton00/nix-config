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
      self.darwinModules.nixSettings
      self.darwinModules.direnv
      self.darwinModules.locale
      self.darwinModules.homebrew
      self.darwinModules.firefox
      self.darwinModules.lukeWork
    ];

    system.stateVersion = 6;

    networking.hostName = "Breeze-G6NVT9PXPP";
  };
}

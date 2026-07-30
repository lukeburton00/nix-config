{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.work-laptopConfiguration = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.modules.darwin.work-laptopHardware
      self.modules.darwin.homeManager
      self.modules.darwin.ghostty
      self.modules.darwin.nixSettings
      self.modules.darwin.direnv
      self.modules.darwin.locale
      self.modules.darwin.homebrew
      self.modules.darwin.firefox
      self.modules.darwin.lukeWork
    ];

    system.stateVersion = 6;

    networking.hostName = "Breeze-G6NVT9PXPP";
  };
}

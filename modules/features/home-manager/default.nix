{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.default = {
    lib,
    config,
    ...
  }: {
    imports = [
      self.modules.homeManager.ghostty
      self.modules.homeManager.devtools
      self.modules.homeManager.worktools
    ];

    ghostty.enable = lib.mkDefault false;
    devtools.enable = lib.mkDefault false;
    worktools.enable = lib.mkDefault false;
  };
}

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
      self.modules.homeManager.zed
      self.modules.homeManager.nh
      self.modules.homeManager.devtools
      self.modules.homeManager.worktools
      self.modules.homeManager.podman
    ];

    ghostty.enable = lib.mkDefault false;
    zed.enable = lib.mkDefault false;
    nh.enable = lib.mkDefault false;
    devtools.enable = lib.mkDefault false;
    worktools.enable = lib.mkDefault false;
    podman.enable = lib.mkDefault false;
  };
}

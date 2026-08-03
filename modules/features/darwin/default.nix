{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.default = {
    lib,
    config,
    ...
  }: {
    imports = [
      self.modules.darwin.base
      self.modules.darwin.desktop-apps
      self.modules.darwin.gaming
      self.modules.darwin.work-apps
    ];

    base.enable = lib.mkDefault true;
    desktop-apps.enable = lib.mkDefault false;
    gaming.enable = lib.mkDefault false;
    work-apps.enable = lib.mkDefault false;
  };
}

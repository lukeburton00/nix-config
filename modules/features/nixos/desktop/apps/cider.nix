{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.cider = {
    imports = [
      self.modules.nixos.flatpak
    ];

    services.flatpak.packages = [
      "sh.cider.Cider"
    ];
  };
}

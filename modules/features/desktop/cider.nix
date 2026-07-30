{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.cider = {
    services.flatpak.packages = [
      "sh.cider.Cider"
    ];
  };
}

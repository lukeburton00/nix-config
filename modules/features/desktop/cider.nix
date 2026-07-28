{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.cider = {
    services.flatpak.packages = [
      "sh.cider.Cider"
    ];
  };
}

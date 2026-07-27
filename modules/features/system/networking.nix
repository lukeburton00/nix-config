{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.networking = {
    services.resolved.enable = true;
    networking = {
      networkmanager.enable = true;
    };
  };
}

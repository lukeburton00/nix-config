{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.networking = {
    services.resolved.enable = true;
    networking = {
      networkmanager.enable = true;
    };
  };
}

{
  self,
  inputs,
  ...
}: let
  tailscale = {
    services.tailscale.enable = true;
  };
in {
  flake.nixosModules.tailscale = tailscale;
  flake.darwinModules.tailscale = tailscale;
}

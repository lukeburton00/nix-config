{
  self,
  inputs,
  ...
}: let
  tailscale = {
    services.tailscale.enable = true;
  };
in {
  flake.modules.nixos.tailscale = tailscale;
  flake.modules.darwin.tailscale = tailscale;
}

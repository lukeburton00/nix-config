{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.tailscale = {
    services.tailscale.enable = true;
  };
}

{lib, ...}: let
  tailscaleModule = {config, ...}: {
    options.tailscale.enable = lib.mkEnableOption "tailscale VPN";
    config = lib.mkIf config.tailscale.enable {
      services.tailscale.enable = true;
    };
  };
in {
  flake.modules.nixos.tailscale = tailscaleModule;
  flake.modules.darwin.tailscale = tailscaleModule;
}

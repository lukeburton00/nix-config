{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.default = {
    lib,
    config,
    ...
  }: {
    imports = [
      self.modules.nixos.base
      self.modules.nixos.cosmic
      self.modules.nixos.desktop-apps
      self.modules.nixos.flatpak
      self.modules.nixos.gaming
      self.modules.nixos.nvidia
      self.modules.nixos.podman
      self.modules.nixos.timezone
      self.modules.nixos.unfree
      self.modules.nixos.tailscale
    ];

    base.enable = lib.mkDefault true;
    timezone.enable = lib.mkDefault true;
    unfree.enable = lib.mkDefault true;
    tailscale.enable = lib.mkDefault true;
    cosmic.enable = lib.mkDefault false;
    desktop-apps.enable = lib.mkDefault false;
    flatpak.enable = lib.mkDefault (config.desktop-apps.enable || config.gaming.enable);
    gaming.enable = lib.mkDefault false;
    nvidia.enable = lib.mkDefault false;
    podman.enable = lib.mkDefault false;
  };
}

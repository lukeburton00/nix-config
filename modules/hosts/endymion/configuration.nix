{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.endymionConfiguration = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.modules.nixos.endymionHardware
      self.modules.nixos.nix-ld
      self.modules.nixos.font
      self.modules.nixos.cider
      self.modules.nixos.systemd-boot
      self.modules.nixos.cosmic
      self.modules.nixos.homeManager
      self.modules.nixos.ghostty
      self.modules.nixos.tailscale
      self.modules.nixos.nixSettings
      self.modules.nixos.direnv
      self.modules.nixos.locale
      self.modules.nixos.networking
      self.modules.nixos.gc
      self.modules.nixos.nvidia
      self.modules.nixos.flatpak
      self.modules.nixos.appimage
      self.modules.nixos.gaming
      self.modules.nixos.catppuccin
      self.modules.nixos.luke
    ];

    system.stateVersion = "26.05";

    networking.hostName = "endymion";
  };
}

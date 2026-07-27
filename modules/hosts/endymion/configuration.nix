{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.endymionConfiguration = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.endymionHardware
      self.nixosModules.nix-ld
      self.nixosModules.systemd-boot
      self.nixosModules.homeManager
      self.nixosModules.ghostty
      self.nixosModules.tailscale
      self.nixosModules.nixSettings
      self.nixosModules.direnv
      self.nixosModules.locale
      self.nixosModules.monitors
      self.nixosModules.networking
      self.nixosModules.gc
      self.nixosModules.nvidia
      self.nixosModules.greetd
      self.nixosModules.flatpak
      self.nixosModules.appimage
      self.nixosModules.librewolf
      self.nixosModules.gaming
      self.nixosModules.luke
    ];

    system.stateVersion = "26.05";

    monitors = {
      primary = "DP-4";
      secondary = "DP-3";
    };

    networking.hostName = "endymion";
  };
}

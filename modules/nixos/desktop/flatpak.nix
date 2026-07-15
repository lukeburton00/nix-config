{inputs, ...}: {
  modules = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];
  services.flatpak.enable = true;
}

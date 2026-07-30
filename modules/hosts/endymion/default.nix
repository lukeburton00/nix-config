{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.endymion = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.endymionConfiguration
    ];
  };
}

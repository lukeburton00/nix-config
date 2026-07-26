{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.endymion = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.endymionConfiguration
    ];
  };
}

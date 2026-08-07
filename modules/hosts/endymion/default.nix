{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.endymion = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      username = "luke";
    };
    modules = [
      self.modules.nixos.endymionHardware
      self.modules.nixos.endymionConfig
    ];
  };
}

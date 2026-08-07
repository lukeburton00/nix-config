{
  self,
  inputs,
  ...
}: {
  flake.darwinConfigurations.gladstone = inputs.darwin.lib.darwinSystem {
    specialArgs = {
      username = "lukeburton";
    };
    modules = [
      self.modules.darwin.gladstoneHardware
      self.modules.darwin.gladstoneConfig
    ];
  };
}

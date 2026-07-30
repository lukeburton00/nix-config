{
  self,
  inputs,
  ...
}: {
  flake.darwinConfigurations.work-laptop = inputs.darwin.lib.darwinSystem {
    specialArgs = {
      username = "lukeburton";
    };
    modules = [
      self.modules.darwin.work-laptopConfiguration
    ];
  };
}

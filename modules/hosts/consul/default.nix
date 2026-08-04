{
  self,
  inputs,
  ...
}: {
  flake.darwinConfigurations.consul = inputs.darwin.lib.darwinSystem {
    specialArgs = {
      username = "luke";
    };
    modules = [
      self.modules.darwin.consul-config
    ];
  };
}

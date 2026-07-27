{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.monitors = {lib, ...}: {
    options.monitors = {
      primary = lib.mkOption {
        type = lib.types.str;
        description = "Primary monitor identifier";
      };
      secondary = lib.mkOption {
        type = lib.types.str;
        description = "Secondary monitor identifier";
      };
    };
  };
}

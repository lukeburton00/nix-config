{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.monitors = {lib, ...}: {
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

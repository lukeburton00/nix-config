{
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.home-manager.flakeModules.home-manager
  ];
  config = {
    systems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];
  };

  options = {
    flake = inputs.flake-parts.lib.mkSubmoduleOptions {
      darwinConfigurations = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.raw;
        default = {};
      };
    };
  };
}

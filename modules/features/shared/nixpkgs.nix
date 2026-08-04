{lib, ...}: let
  nixpkgsModule = {config, ...}: {
    options.unfree.enable = lib.mkEnableOption "unfree packages";
    config = lib.mkIf config.unfree.enable {
      nixpkgs.config.allowUnfree = true;
    };
  };
in {
  flake.modules.nixos.unfree = nixpkgsModule;
  flake.modules.darwin.unfree = nixpkgsModule;
}

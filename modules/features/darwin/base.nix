{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.base = {
    lib,
    config,
    username,
    ...
  }: {
    options = {
      base.enable = lib.mkEnableOption "enables base darwin configurations";
    };

    imports = [
      inputs.nix-homebrew.darwinModules.nix-homebrew
      inputs.home-manager.darwinModules.default
    ];

    config = lib.mkIf config.base.enable {
      nix.enable = false;

      nix-homebrew = {
        enable = true;
        user = username;
        autoMigrate = true;
        taps = {
          "homebrew/homebrew-core" = inputs.homebrew-core;
          "homebrew/homebrew-cask" = inputs.homebrew-cask;
        };
      };

      homebrew = {
        enable = true;
        taps = builtins.attrNames config.nix-homebrew.taps;
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
          inherit self inputs;
        };
      };
    };
  };
}

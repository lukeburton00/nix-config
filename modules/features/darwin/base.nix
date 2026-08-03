{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.base = {
    config,
    username,
    ...
  }: {
    imports = [
      inputs.nix-homebrew.darwinModules.nix-homebrew
      inputs.home-manager.darwinModules.default
    ];

    time.timeZone = "America/Denver";

    nix.enable = false;
    nixpkgs.config.allowUnfree = true;

    services.tailscale.enable = true;

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
}

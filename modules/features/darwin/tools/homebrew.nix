{ self, inputs, ... }: {
  flake.modules.darwin.homebrew = { config, username, ... }: {
    imports = [
      inputs.nix-homebrew.darwinModules.nix-homebrew
    ];

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
  };
}

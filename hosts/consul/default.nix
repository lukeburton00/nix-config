{
  self,
  config,
  inputs,
  username,
  ...
}: let
  homeDirectory = "/Users/${username}";
in {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
    ../../modules/nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  system = {
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 6;
  };

  networking = {
    hostName = "consul";
    computerName = "consul";
  };
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

  system.primaryUser = username;
  users.users.${username}.home = homeDirectory;

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
    brews = [];
    casks = [
      "firefox"
      "ghostty"
    ];
  };

  home-manager.users.${username} = {
    imports = [
      ../../modules/home/core.nix
    ];
    home = {
      inherit username;
      inherit homeDirectory;
      stateVersion = "26.11";
    };
  };
}

{
  self,
  username,
  ...
}: let
  homeDirectory = "/Users/${username}";
in {
  imports = [
    ../../modules/common/cli/core.nix
    ../../modules/common/cli/dev.nix
    ../../modules/common/tailscale.nix
    ../../modules/common/nix.nix
    ../../modules/darwin/homebrew.nix
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

  homebrew.brews = [];
  homebrew.casks = [
    "discord"
    "firefox"
    "ghostty"
  ];
}

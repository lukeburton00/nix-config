{
  inputs,
  username,
  ...
}: let
  homeDirectory = "/Users/${username}";
in {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
    ./darwin.nix
    ./system.nix
    ../../modules/nix
    ../../modules/homebrew
    ./homebrew.nix
  ];
  system.primaryUser = username;
  users.users.${username}.home = homeDirectory;

  home-manager.users.${username} = import ../../home/${username} {
    inherit username homeDirectory;
  };
}

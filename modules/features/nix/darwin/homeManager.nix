{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.nix = {
    config,
    username,
    ...
  }: {
    imports = [
      inputs.home-manager.darwinModules.default
    ];

    home-manager = {
      users.${username} = self.modules.homeManager.${username};
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}

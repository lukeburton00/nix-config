{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.nix = {username, ...}: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];
    home-manager = {
      users.${username} = self.modules.homeManager.${username};
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}

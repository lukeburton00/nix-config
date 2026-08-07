{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.homeManager = {username, ...}: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];
    home-manager = {
      users.${username} = self.modules.homeManager.${username};
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {
        inherit self inputs;
      };
    };
  };
}

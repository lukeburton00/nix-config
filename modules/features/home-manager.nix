{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.homeManager = {
    imports = [
      inputs.home-manager.nixosModules.default
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {
        inherit self inputs;
      };
    };
  };

  flake.darwinModules.homeManager = {...}: {
    imports = [
      inputs.home-manager.darwinModules.default
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {
        inherit self inputs;
      };
    };
  };
}

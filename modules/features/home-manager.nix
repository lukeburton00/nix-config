{
  self,
  inputs,
  ...
}:
let
  homeManagerBase = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {
        inherit self inputs;
      };
    };
  };
in {
  flake.nixosModules.homeManager = homeManagerBase // {
    imports = [inputs.home-manager.nixosModules.default];
  };
  flake.darwinModules.homeManager = homeManagerBase // {
    imports = [inputs.home-manager.darwinModules.default];
  };
}

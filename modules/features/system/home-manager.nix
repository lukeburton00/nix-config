{
  self,
  inputs,
  ...
}: let
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
  flake.modules.nixos.homeManager =
    homeManagerBase
    // {
      imports = [inputs.home-manager.nixosModules.default];
    };
  flake.modules.darwin.homeManager =
    homeManagerBase
    // {
      imports = [inputs.home-manager.darwinModules.default];
    };
}

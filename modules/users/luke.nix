{
  self,
  inputs,
  lib,
  config,
  ...
}: let
  username = "luke";

  mkHomeConfig = system:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      modules = [
        self.modules.homeManager.${username}
        {
          home = {
            username = username;
            homeDirectory =
              if lib.hasSuffix "darwin" system
              then "/Users/${username}"
              else "/home/${username}";
          };
        }
      ];
    };
in {
  flake.modules.homeManager.${username} = {
    imports = with self.modules.homeManager; [
      aerospace
      dev
      nix
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };

  flake.homeConfigurations = lib.mergeAttrsList (
    lib.map (system: {
      "${username}@${system}" = mkHomeConfig system;
    })
    config.systems
  );
}

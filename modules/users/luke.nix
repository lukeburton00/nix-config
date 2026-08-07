let
  username = "luke";
in
  {
    self,
    inputs,
    ...
  }: {
    flake.modules.homeManager.${username} = {
      imports = with self.modules.homeManager; [
        base
        development
        ghostty
        nh
        podman
      ];
    };

    flake.homeConfigurations = {
      luke = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        modules = [
          self.modules.homeManager.luke
          {
            home = {
              username = "luke";
              homeDirectory = "/home/luke";
            };
          }
        ];
      };
    };
  }

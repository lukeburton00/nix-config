{
  self,
  inputs,
  ...
}: {
  flake = {
    modules = {
      homeManager.dev = {pkgs, ...}: {
        services.podman = {
          enable = true;
          settings.containers = {
            compose_warning_logs = false;
          };
        };

        home.packages = [pkgs.podman-compose];
      };

      nixos.dev = {username, ...}: {
        virtualisation.containers.enable = true;

        virtualisation.podman = {
          enable = true;
          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true;
        };

        users.users.${username}.extraGroups = ["podman"];
      };

      darwin.dev = {pkgs, ...}: {
        environment.systemPackages = [pkgs.podman];
      };
    };
  };
}

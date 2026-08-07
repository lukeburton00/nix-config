{ self, inputs, ... }: {
  flake.modules.homeManager.podman = { pkgs, ... }: {
    services.podman = {
      enable = true;
      settings.containers = {
        compose_warning_logs = false;
      };
    };

    home.packages = [ pkgs.podman-compose ];
  };
}

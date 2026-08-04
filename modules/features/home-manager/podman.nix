{lib, ...}: {
  flake.modules.homeManager.podman = {
    config,
    pkgs,
    ...
  }: {
    options.podman.enable = lib.mkEnableOption "podman container runtime and compose tooling";

    config = lib.mkIf config.podman.enable {
      services.podman = {
        enable = true;
        settings.containers = {
          compose_warning_logs = false;
        };
      };

      home.packages = [pkgs.podman-compose];
    };
  };
}

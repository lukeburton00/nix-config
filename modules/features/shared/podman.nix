{
  lib,
  ...
}: let
  sharedPodmanEnv = {
    environment.sessionVariables = {
      PODMAN_COMPOSE_WARNING_LOGS = "false";
    };
  };
in {
  flake.modules.nixos.podman = {
    config,
    pkgs,
    username,
    ...
  }: {
    options.podman.enable = lib.mkEnableOption "podman container runtime and compose tooling";

    config = lib.mkIf config.podman.enable (lib.mkMerge [
      sharedPodmanEnv
      {
        virtualisation.containers.enable = true;
        virtualisation.podman = {
          enable = true;
          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true;
        };
        users.users.${username}.extraGroups = ["podman"];
        environment.systemPackages = [pkgs.podman-compose];
      }
    ]);
  };
}

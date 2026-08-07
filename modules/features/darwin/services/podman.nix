{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.podman = {pkgs, ...}: {
    environment.systemPackages = [pkgs.podman];
  };
}

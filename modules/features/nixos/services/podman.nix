{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.podman = {username, ...}: {
    virtualisation.containers.enable = true;

    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    users.users.${username}.extraGroups = ["podman"];
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.consul-config = {
    pkgs,
    lib,
    username,
    ...
  }: {
    imports = [
      self.modules.darwin.consul-hardware
      self.modules.darwin.default
    ];

    system.stateVersion = 6;

    networking.hostName = "consul";

    system.primaryUser = "${username}";
    users.users.${username}.home = "/Users/${username}";

    desktop-apps.enable = true;

    home-manager.users.${username} = {
      imports = [self.modules.homeManager.${username}];
      podman.enable = true;
    };
  };
}

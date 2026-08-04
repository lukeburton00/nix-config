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
    home-manager.users.${username} = self.modules.homeManager.${username};
    users.users.${username}.home = "/Users/${username}";

    desktop-apps.enable = true;
  };
}

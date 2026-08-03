{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.work-laptop-config = {
    pkgs,
    lib,
    username,
    ...
  }: {
    imports = [
      self.modules.darwin.work-laptop-hardware
      self.modules.darwin.default
    ];

    system.stateVersion = 6;

    system.primaryUser = "${username}";
    home-manager.users.${username} = self.modules.homeManager.${username};
    users.users.${username}.home = "/Users/${username}";

    desktop.enable = true;
    work-apps.enable = true;
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.work-laptopConfiguration = {
    pkgs,
    lib,
    username,
    ...
  }: {
    imports = [
      self.modules.darwin.work-laptop-hardware
      self.modules.darwin.base
      self.modules.darwin.desktop
      self.modules.darwin.work-tools
    ];

    system.stateVersion = 6;

    system.primaryUser = "${username}";
    home-manager.users.${username} = self.modules.homeManager.${username};
    users.users.${username}.home = "/Users/${username}";
  };
}

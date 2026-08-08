{self, ...}: {
  flake.modules.darwin.gladstoneConfig = {username, ...}: {
    imports = with self.modules.darwin; [
      nix
      font

      desktop
      work
      dev
    ];

    system.stateVersion = 6;
    time.timeZone = "America/Denver";

    system.primaryUser = username;
    users.users.${username}.home = "/Users/${username}";
  };
}

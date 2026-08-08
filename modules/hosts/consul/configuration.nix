{self, ...}: {
  flake.modules.darwin.consulConfig = {username, ...}: {
    imports = with self.modules.darwin; [
      nix
      font

      desktop
      gaming
      dev
    ];

    system.stateVersion = 6;
    time.timeZone = "America/Denver";

    services.tailscale.enable = true;
    networking.hostName = "consul";

    system.primaryUser = username;
    users.users.${username}.home = "/Users/${username}";
  };
}

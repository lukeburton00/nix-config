{self, ...}: {
  flake.modules.nixos.endymionConfig = {
    pkgs,
    username,
    ...
  }: {
    imports = with self.modules.nixos; [
      nix
      boot
      audio
      font
      nvidia

      cosmic
      desktop
      gaming
      dev
    ];

    system.stateVersion = "26.05";
    time.timeZone = "America/Denver";

    networking.hostName = "endymion";
    networking.networkmanager.enable = true;

    services.resolved.enable = true;
    services.tailscale.enable = true;

    programs.zsh.enable = true;
    users.users.${username} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.zsh;
    };
  };
}

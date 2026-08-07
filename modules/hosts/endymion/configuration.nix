{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.endymionConfig = {
    pkgs,
    username,
    ...
  }: {
    imports = with self.modules.nixos; [
      boot
      fonts
      networking
      nvidia
      pipewire
      timezone
      nixSettings
      homeManager

      cosmic
      firefox
      cider
      gaming
      nvidia
      podman
      tailscale
    ];

    system.stateVersion = "26.05";

    networking.hostName = "endymion";

    programs.zsh.enable = true;

    users.users.${username} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.zsh;
    };
  };
}

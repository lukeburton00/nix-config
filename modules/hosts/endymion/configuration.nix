{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.endymion-config = {
    pkgs,
    lib,
    username,
    ...
  }: {
    imports = [
      self.modules.nixos.endymion-hardware
      self.modules.nixos.default
    ];

    system.stateVersion = "26.05";

    networking.hostName = "endymion";

    programs.zsh.enable = true;

    users.users.${username} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.zsh;
    };

    home-manager.users.${username} = {
      imports = [
        self.modules.homeManager.${username}
      ];
    };

    cosmic.enable = true;
    desktop-apps.enable = true;
    gaming.enable = true;
    nvidia.enable = true;
  };
}

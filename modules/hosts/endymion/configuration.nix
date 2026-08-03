{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.endymionConfiguration = {
    pkgs,
    lib,
    username,
    ...
  }: {
    imports = [
      self.modules.nixos.endymion-hardware
      self.modules.nixos.desktop
      self.modules.nixos.cosmic
      self.modules.nixos.base
      self.modules.nixos.nvidia
      self.modules.nixos.gaming
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
  };
}

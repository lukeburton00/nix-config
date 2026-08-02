{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.luke = {pkgs, ...}: {
    imports = [
      self.modules.homeManager.ghostty
      self.modules.homeManager.firefox
      self.modules.homeManager.devtools
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };

  flake.modules.nixos.luke = {
    pkgs,
    lib,
    ...
  }: {
    programs.zsh.enable = true;
    users.users.luke = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.zsh;
    };
    home-manager.users.luke = {
      imports = [
        self.modules.homeManager.luke
      ];
    };
  };

  flake.modules.darwin.luke = {
    home-manager.users.luke = {
      imports = [
        self.modules.homeManager.luke
      ];
      home.homeDirectory = "/Users/luke";
    };
  };
}

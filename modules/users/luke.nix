{
  self,
  inputs,
  ...
}: {
  flake.homeModules.luke = {pkgs, ...}: {
    imports = [
      self.homeModules.ghostty
      self.homeModules.firefox
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
        self.homeModules.luke
        self.homeModules.catppuccin
      ];
    };
  };

  flake.modules.darwin.luke = {
    home-manager.users.luke = {
      imports = [
        self.homeModules.luke
      ];
      home.homeDirectory = "/Users/luke";
    };
  };
}

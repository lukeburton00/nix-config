{self, ...}: let
  username = "lukeburton";
in {
  flake.modules.homeManager.${username} = {
    imports = with self.modules.homeManager; [
      aerospace
      dev
      nix
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };
}

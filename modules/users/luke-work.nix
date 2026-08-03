{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.lukeburton = {pkgs, ...}: {
    imports = [
      self.modules.homeManager.default
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
    home.homeDirectory = "/Users/lukeburton";

    devtools.enable = true;
    worktools.enable = true;
    ghostty.enable = true;
    zed.enable = true;
    nh.enable = true;
  };
}

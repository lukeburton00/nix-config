{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.luke = {pkgs, ...}: {
    imports = [
      self.modules.homeManager.default
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;

    devtools.enable = true;
    ghostty.enable = true;
    zed.enable = true;
    nh.enable = true;
  };
}

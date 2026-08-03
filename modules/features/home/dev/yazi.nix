{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-yazi = {pkgs, ...}: {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        mgr = {
          show_hidden = true;
        };
      };
    };
  };
}

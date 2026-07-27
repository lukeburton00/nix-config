{
  self,
  inputs,
  ...
}: {
  flake.homeModules.yazi = {
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

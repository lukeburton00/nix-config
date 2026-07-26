{
  self,
  inputs,
  ...
}: {
  flake.homeModules.fuzzel = {
    programs.fuzzel = {
      enable = true;
      settings = {
        colors = {
          background = "1e1e1eff";
          text = "ffffffff";
          match = "3584e4ff";
          selection = "303030ff";
          selection-text = "ffffffff";
          border = "00000000";
        };
      };
    };
  };
}

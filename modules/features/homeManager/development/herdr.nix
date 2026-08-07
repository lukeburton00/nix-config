{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.development = {pkgs, ...}: {
    programs.herdr = {
      enable = true;

      settings = {
        theme = {
          name = "nord";
        };

        experimental = {
          kitty_graphics = false;
          pane_history = false;
        };
      };
    };
  };
}

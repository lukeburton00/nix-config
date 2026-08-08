{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev = {pkgs, ...}: {
    programs.zed-editor = {
      enable = true;
      package = pkgs.zed-editor;
      extensions = [
        "nix"
        "lua"
        "toml"
        "html"
        "css"
        "nord"
      ];
      userSettings = {
        ui_font_size = 16;
        buffer_font_size = 15;
        theme = {
          mode = "system";
          light = "One Light";
          dark = "Nord Darker";
        };
        vim_mode = true;
        telemetry = {
          metrics = false;
        };
      };
    };
  };
}

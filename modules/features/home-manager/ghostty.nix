{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.ghostty = {
    lib,
    config,
    pkgs,
    ...
  }: {
    options = {
      ghostty.enable = lib.mkEnableOption "enables ghostty";
    };

    config = lib.mkIf config.ghostty.enable {
      programs.ghostty = {
        enable = true;
        systemd.enable = !pkgs.stdenv.isDarwin;
        package =
          if pkgs.stdenv.isDarwin
          then null
          else pkgs.ghostty;

        settings = {
          "font-family" = "Maple Mono NF";
          "font-size" = 15;
          "quit-after-last-window-closed" = true;
          "term" = "xterm-256color";
          "theme" = "Nord Wave";
        };
      };
    };
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev = {
    pkgs,
    lib,
    ...
  }: {
    programs.ghostty = {
      enable = true;
      # ghostty is linux-only in nixpkgs; on darwin it's installed via the homebrew cask
      package = lib.mkIf pkgs.stdenv.isDarwin null;
      systemd.enable = !pkgs.stdenv.isDarwin;

      settings = {
        "font-family" = "Maple Mono NF";
        "font-size" =
          if pkgs.stdenv.isDarwin
          then 17
          else 15;

        "quit-after-last-window-closed" = true;
        "term" = "xterm-256color";
        "theme" = "Nord Wave";
      };
    };
  };

  flake.modules.darwin.dev = {
    homebrew.casks = [
      "ghostty"
    ];
  };
}

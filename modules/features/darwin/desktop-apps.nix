{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.desktop-apps = {
    lib,
    config,
    ...
  }: {
    options = {
      desktop-apps.enable = lib.mkEnableOption "enables desktop applications";
    };

    config = lib.mkIf config.desktop-apps.enable {
      homebrew.casks = [
        "firefox"
        "ghostty"
        "font-maple-mono-nf"
      ];
    };
  };
}

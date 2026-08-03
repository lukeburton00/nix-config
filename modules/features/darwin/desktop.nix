{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.desktop = {
    lib,
    config,
    ...
  }: {
    options = {
      desktop.enable = lib.mkEnableOption "enables desktop applications";
    };

    config = lib.mkIf config.desktop.enable {
      homebrew.casks = [
        "firefox"
        "ghostty"
      ];
    };
  };
}

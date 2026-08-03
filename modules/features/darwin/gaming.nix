{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.gaming = {
    lib,
    config,
    ...
  }: {
    options = {
      gaming.enable = lib.mkEnableOption "enables gaming applications";
    };

    config = lib.mkIf config.gaming.enable {
      homebrew.casks = [
        "steam"
        "discord"
      ];
    };
  };
}

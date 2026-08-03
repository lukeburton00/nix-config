{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.work-apps = {
    lib,
    config,
    ...
  }: {
    options = {
      work-apps.enable = lib.mkEnableOption "enables work applications";
    };

    config = lib.mkIf config.work-apps.enable {
      homebrew.casks = [
        "postman"
        "twingate"
        "pgadmin4"
      ];
    };
  };
}

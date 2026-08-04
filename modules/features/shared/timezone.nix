{lib, ...}: let
  timezoneModule = {config, ...}: {
    options.timezone.enable = lib.mkEnableOption "America/Denver timezone";
    config = lib.mkIf config.timezone.enable {
      time.timeZone = "America/Denver";
    };
  };
in {
  flake.modules.nixos.timezone = timezoneModule;
  flake.modules.darwin.timezone = timezoneModule;
}

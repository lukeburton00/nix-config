{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.locale = {
    time.timeZone = "America/Denver";
    i18n.defaultLocale = "en_US.UTF-8";
  };
  flake.modules.darwin.locale = {
    time.timeZone = "America/Denver";
  };
}

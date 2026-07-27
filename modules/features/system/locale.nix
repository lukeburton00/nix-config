{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.locale = {
    time.timeZone = "America/Denver";
    i18n.defaultLocale = "en_US.UTF-8";
  };
  flake.darwinModules.locale = {
    time.timeZone = "America/Denver";
  };
}

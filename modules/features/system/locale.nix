{
  self,
  inputs,
  ...
}: let
  locale = {
    time.timeZone = "America/Denver";
    i18n.defaultLocale = "en_US.UTF-8";
  };
in {
  flake.nixosModules.locale = locale;
  flake.darwinModules.locale = locale;
}

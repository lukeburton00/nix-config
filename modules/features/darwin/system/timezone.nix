{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.timezone = {
    time.timeZone = "America/Denver";
  };
}

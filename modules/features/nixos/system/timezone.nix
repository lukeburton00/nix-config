{ ... }: {
  flake.modules.nixos.timezone = {
    time.timeZone = "America/Denver";
  };
}

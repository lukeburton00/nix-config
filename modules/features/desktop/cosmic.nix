{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.cosmic = {
    services = {
      displayManager.cosmic-greeter.enable = true;
      desktopManager.cosmic.enable = true;
      system76-scheduler.enable = true;
    };
  };
}

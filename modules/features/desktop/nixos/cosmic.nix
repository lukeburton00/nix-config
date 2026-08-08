{
  flake.modules.nixos.cosmic = {pkgs, ...}: {
    services = {
      displayManager.cosmic-greeter.enable = true;
      desktopManager.cosmic.enable = true;
      system76-scheduler.enable = true;
    };
  };
}

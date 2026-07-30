{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.cosmic = {pkgs, ...}: {
    services = {
      displayManager.cosmic-greeter.enable = true;
      desktopManager.cosmic.enable = true;
      system76-scheduler.enable = true;
    };

    environment.systemPackages = with pkgs; [
      xrandr
    ];
  };
}

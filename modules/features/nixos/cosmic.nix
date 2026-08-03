{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.cosmic = {
    lib,
    config,
    pkgs,
    ...
  }: {
    options = {
      cosmic.enable = lib.mkEnableOption "enables Cosmic DE";
    };
    config = lib.mkIf config.cosmic.enable {
      services = {
        displayManager.cosmic-greeter.enable = true;
        desktopManager.cosmic.enable = true;
        system76-scheduler.enable = true;
      };

      environment.systemPackages = with pkgs; [
        xrandr
      ];
    };
  };
}

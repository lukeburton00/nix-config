{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.plasma = {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.plasma-login-manager.enable = true;
    };
  };
}

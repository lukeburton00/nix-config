{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.gnome = {pkgs, ...}: {
    services = {
      xserver.enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xserver.xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}

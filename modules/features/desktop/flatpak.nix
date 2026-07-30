{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.flatpak = {pkgs, ...}: {
    imports = [
      inputs.nix-flatpak.modules.nixos.nix-flatpak
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-wlr];
      config.common.default = "*";
    };

    services = {
      flatpak = {
        enable = true;
        update.auto.enable = true;
        remotes = [
          {
            name = "flathub";
            location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
          }
        ];
      };
    };
  };
}

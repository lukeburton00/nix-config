{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
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
}

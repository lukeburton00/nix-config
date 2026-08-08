{inputs, ...}: {
  flake.modules.nixos.desktop = {lib, ...}: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    xdg.portal.enable = true;

    services.flatpak = {
      enable = true;
      update.auto.enable = true;
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
    };

    programs.firefox.enable = true;

    services.flatpak.packages = [
      "sh.cider.Cider"
    ];
  };
}

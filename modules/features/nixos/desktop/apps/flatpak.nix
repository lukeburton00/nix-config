{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.flatpak = {lib, ...}: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    xdg.portal.enable = lib.mkDefault true;

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
  };
}

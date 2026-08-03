{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.flatpak = {
    lib,
    config,
    ...
  }: {
    options = {
      flatpak.enable = lib.mkEnableOption "enables Flatpak support";
    };

    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    config = lib.mkIf config.flatpak.enable {
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
  };
}

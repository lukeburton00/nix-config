{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.desktop = {pkgs, ...}: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    programs = {
      appimage.enable = true;
      appimage.binfmt = true;

      firefox = {
        enable = true;
      };
    };


    fonts.packages = with pkgs; [
      maple-mono.NF
    ];

    services.flatpak = {
      enable = true;
      update.auto.enable = true;
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      packages = [
        "sh.cider.Cider"
      ];
    };
  };
}

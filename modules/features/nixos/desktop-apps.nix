{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.desktop-apps = {
    lib,
    config,
    pkgs,
    ...
  }: {
    options = {
      desktop-apps.enable = lib.mkEnableOption "enables desktop applications";
    };

    config = lib.mkIf config.desktop-apps.enable {
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

      services.flatpak.packages = [
        "sh.cider.Cider"
      ];
    };
  };
}

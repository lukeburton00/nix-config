{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.gaming = {
    lib,
    config,
    pkgs,
    ...
  }: {
    options = {
      gaming.enable = lib.mkEnableOption "enables gaming support";
    };

    config = lib.mkIf config.gaming.enable {
      programs = {
        steam = {
          enable = true;
          remotePlay.openFirewall = true;
        };
        gamemode.enable = true;
      };

      environment.systemPackages = with pkgs; [
        discord
        ckan
        heroic
        prismlauncher
      ];

      services.flatpak = lib.mkIf config.flatpak.enable {
        remotes = [
          {
            name = "amethyst";
            location = "https://chrisdkn.github.io/Amethyst-Mod-Manager/amethyst.flatpakrepo";
          }
        ];

        packages = [
          {
            appId = "io.github.Amethyst.ModManager//stable";
            origin = "amethyst";
          }
          "com.vysp3r.ProtonPlus"
        ];
      };
    };
  };
}

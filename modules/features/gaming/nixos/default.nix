{
  flake.modules.nixos.gaming = {pkgs, ...}: {
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

    services.flatpak = {
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
}

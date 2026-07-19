{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
    gamemode.enable = true;
  };

  services.flatpak.remotes = [
    {
      name = "amethyst";
      location = "https://chrisdkn.github.io/Amethyst-Mod-Manager/amethyst.flatpakrepo";
    }
  ];

  services.flatpak.packages = [
    {
      appId = "io.github.Amethyst.ModManager//stable";
      origin = "amethyst";
    }

    "com.vysp3r.ProtonPlus"
  ];

  environment.systemPackages = with pkgs; [
    ckan
  ];
}

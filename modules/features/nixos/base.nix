{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.base = {
    lib,
    config,
    pkgs,
    ...
  }: {
    options = {
      base.enable = lib.mkEnableOption "enables base NixOS configurations";
    };

    imports = [
      inputs.home-manager.nixosModules.default
    ];

    config = lib.mkIf config.base.enable {
      i18n.defaultLocale = "en_US.UTF-8";

      services.resolved.enable = true;
      networking.networkmanager.enable = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nix.gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 10d";
      };

      boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;
        kernelPackages = pkgs.linuxPackages_latest;
        kernel.sysctl = {
          "net.core.default_qdisc" = "fq";
          "net.ipv4.tcp_congestion_control" = "bbr";
        };
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
          inherit self inputs;
        };
      };
    };
  };
}

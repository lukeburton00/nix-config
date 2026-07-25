{
  pkgs,
  username,
  lib,
  ...
}: {
  options.monitors = lib.mkOption {
    type = lib.types.attrs;
    default = {};
  };

  imports = [
    ./hardware-configuration.nix

    ../../features/locale
    ../../features/nix
    ../../features/tailscale
    ../../features/direnv

    ../../features/nixos/gc
    ../../features/nixos/nvidia
    ../../features/nixos/greetd
    ../../features/nixos/flatpak
    ../../features/nixos/appimage
    ../../features/nixos/gaming
  ];

  config = {
    monitors = {
      primary = "DP-4";
      secondary = "DP-3";
    };

    system.stateVersion = "26.05";

    boot = {
      loader.systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;
      kernelPackages = pkgs.linuxPackages_latest;
      kernelParams = [
        "quiet"
        "splash"
      ];
      plymouth.enable = true;
      kernel.sysctl = {
        "net.core.default_qdisc" = "fq";
        "net.ipv4.tcp_congestion_control" = "bbr";
      };
    };

    services.resolved.enable = true;
    networking = {
      hostName = "endymion";
      networkmanager.enable = true;
    };

    programs.zsh.enable = true;
    users.users."${username}" = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.zsh;
    };

    environment.systemPackages = with pkgs; [
      discord
      librewolf
    ];

    services.flatpak.packages = [
      "it.mijorus.gearlever"
      "com.github.tchx84.Flatseal"
    ];
  };
}

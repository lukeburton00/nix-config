{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/cli/core.nix
    ../../modules/common/cli/dev.nix
    ../../modules/common/nix.nix
    ../../modules/common/locale.nix
    ../../modules/nixos/hardware/nvidia.nix
    ../../modules/nixos/desktop/gnome.nix
    ../../modules/nixos/desktop/flatpak.nix
    ../../modules/nixos/desktop/appimage.nix
    ../../modules/nixos/desktop/gaming.nix
  ];
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
    firefox
    ghostty
    discord
  ];

  services.flatpak.packages = [
    "it.mijorus.gearlever"
  ];
}

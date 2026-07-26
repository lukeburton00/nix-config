{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.endymionConfiguration = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.endymionHardware
      self.nixosModules.homeManager
      self.nixosModules.ghostty
      self.nixosModules.gnome
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;

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
    users.users.luke = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.zsh;
    };

    home-manager.users.luke = self.homeModules.luke;

    environment.systemPackages = with pkgs; [
      discord
      librewolf
      neovim
    ];
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.endymionHardware = {
    config,
    lib,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "uas" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/a7a29beb-1cfd-496f-99ac-e53dd4ec8237";
      fsType = "btrfs";
    };

    fileSystems."/nix" = {
      device = "/dev/disk/by-uuid/a7a29beb-1cfd-496f-99ac-e53dd4ec8237";
      fsType = "btrfs";
      options = ["subvol=nix"];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/9AC7-C193";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/9cfe880e-7450-4cf4-b132-48a88e367d7b";
      fsType = "btrfs";
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/0ea29636-7f7f-4b2e-a089-f0fc0cebd278";}
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = true;
  };
}

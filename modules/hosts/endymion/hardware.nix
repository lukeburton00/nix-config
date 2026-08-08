{
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
      device = "/dev/disk/by-uuid/3251db13-e56b-4628-876f-a62363c8fbc0";
      fsType = "btrfs";
    };

    fileSystems."/nix" = {
      device = "/dev/disk/by-uuid/3251db13-e56b-4628-876f-a62363c8fbc0";
      fsType = "btrfs";
      options = ["subvol=nix"];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/0EB0-F7E4";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/4b0eb9a5-1c6e-4ed1-abe8-210b63ca9757";
      fsType = "btrfs";
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/fdfbbef1-958f-4fbd-a234-28cf29974b84";}
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}

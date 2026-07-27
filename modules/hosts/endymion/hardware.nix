{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.endymionHardware = {
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
      device = "/dev/disk/by-uuid/70a676fe-d262-4da0-8ea7-336b7867fe46";
      fsType = "btrfs";
    };

    fileSystems."/nix" = {
      device = "/dev/disk/by-uuid/70a676fe-d262-4da0-8ea7-336b7867fe46";
      fsType = "btrfs";
      options = ["subvol=nix"];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/1151-C0F7";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/97294702-dcb7-40c5-860e-e33a471d9fe5";
      fsType = "btrfs";
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/6ebadaef-3b45-4027-888b-77d3d777ce52";}
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}

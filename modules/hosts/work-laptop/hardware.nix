{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.work-laptopHardware = {lib, ...}: {
    nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
  };
}

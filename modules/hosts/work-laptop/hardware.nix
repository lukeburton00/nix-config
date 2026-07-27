{
  self,
  inputs,
  ...
}: {
  flake.darwinModules.work-laptopHardware = {
    lib,
    ...
  }: {
    nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
  };
}

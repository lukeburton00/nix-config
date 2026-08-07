{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.gladstoneHardware = {lib, ...}: {
    nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
  };
}

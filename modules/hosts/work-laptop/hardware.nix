{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.work-laptop-hardware = {lib, ...}: {
    nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
  };
}

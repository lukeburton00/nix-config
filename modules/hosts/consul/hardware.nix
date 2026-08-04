{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.consul-hardware = {lib, ...}: {
    nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
  };
}

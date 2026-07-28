{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.font = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      maple-mono.NF
    ];
  };
}

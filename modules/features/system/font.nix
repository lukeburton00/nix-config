{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.font = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      maple-mono.NF
    ];
  };
}

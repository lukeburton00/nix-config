{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.fonts = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      maple-mono.NF
    ];
  };
}

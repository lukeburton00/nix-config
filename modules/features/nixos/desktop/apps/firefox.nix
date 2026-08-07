{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.firefox = {
    programs.firefox.enable = true;
  };
}

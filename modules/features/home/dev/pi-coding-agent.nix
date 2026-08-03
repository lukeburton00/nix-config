{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-pi-coding-agent = {pkgs, ...}: {
    programs.pi-coding-agent = {
      enable = true;
      extraPackages = [pkgs.nodejs pkgs.bun];
      settings = {};
    };
  };
}

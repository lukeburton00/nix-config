{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-pi-coding-agent = {
    lib,
    config,
    pkgs,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.pi-coding-agent = {
        enable = true;
        extraPackages = [pkgs.nodejs pkgs.bun];
        settings = {};
      };
    };
  };
}

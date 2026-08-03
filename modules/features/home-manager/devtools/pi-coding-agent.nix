{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.pi-coding-agent = {
    lib,
    config,
    pkgs,
    ...
  }: {
    options = {
      pi-coding-agent.enable = lib.mkEnableOption "enables pi-coding-agent";
    };

    config = lib.mkIf config.pi-coding-agent.enable {
      programs.pi-coding-agent = {
        enable = true;
        extraPackages = [pkgs.nodejs pkgs.bun];
        settings = {
          packages = [
            "npm:pi-web-access"
          ];
          hideThinkingBlock = true;
        };
      };
    };
  };
}

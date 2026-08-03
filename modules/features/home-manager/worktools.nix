{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.worktools = {
    lib,
    config,
    pkgs,
    ...
  }: {
    options = {
      worktools.enable = lib.mkEnableOption "enables work tools";
    };

    config = lib.mkIf config.worktools.enable {
      home.packages = with pkgs; [
        codex
        claude-code

        glab
        awscli2
        sentry-cli
      ];
    };
  };
}

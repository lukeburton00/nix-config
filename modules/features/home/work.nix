{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.work-tools = {pkgs, ...}: {
    home.packages = with pkgs; [
      codex
      claude-code

      glab
      awscli2
      sentry-cli
    ];
  };
}

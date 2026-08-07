{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.work = {pkgs, ...}: {
    home.packages = with pkgs; [
      codex
      claude-code

      glab
      awscli2
      sentry-cli
    ];
  };
}

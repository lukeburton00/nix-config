{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.workTools = {pkgs, ...}: {
    home.packages = with pkgs; [
      codex
      claude-code

      glab
      awscli2
      sentry-cli
    ];
  };

  flake.modules.darwin.workTools = {
    homebrew.casks = [
      "postman"
      "twingate"
      "pgadmin4"
    ];
  };
}

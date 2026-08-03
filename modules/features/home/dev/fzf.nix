{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-fzf = {pkgs, ...}: {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-mise = {pkgs, ...}: {
    programs.mise = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

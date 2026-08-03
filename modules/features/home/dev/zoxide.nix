{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-zoxide = {pkgs, ...}: {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

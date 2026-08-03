{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-lazygit = {pkgs, ...}: {
    programs.lazygit = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

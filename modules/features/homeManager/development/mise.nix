{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.development = {
    programs.mise = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

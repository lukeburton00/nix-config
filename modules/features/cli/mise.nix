{
  self,
  inputs,
  ...
}: {
  flake.homeModules.mise = {
    programs.mise = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

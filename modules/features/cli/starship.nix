{
  self,
  inputs,
  ...
}: {
  flake.homeModules.starship = {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        aws.disabled = true;
      };
    };
  };
}

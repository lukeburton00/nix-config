{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-starship = {pkgs, ...}: {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        aws.disabled = true;
      };
    };
  };
}

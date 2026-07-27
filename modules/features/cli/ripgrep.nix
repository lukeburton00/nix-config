{
  self,
  inputs,
  ...
}: {
  flake.homeModules.ripgrep = {
    programs.ripgrep = {
      enable = true;
      arguments = [
        "--hidden"
        "--glob=!.git/*"
      ];
    };
  };
}

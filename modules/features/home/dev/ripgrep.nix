{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-ripgrep = {pkgs, ...}: {
    programs.ripgrep = {
      enable = true;
      arguments = [
        "--hidden"
        "--glob=!.git/*"
      ];
    };
  };
}

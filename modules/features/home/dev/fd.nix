{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-fd = {pkgs, ...}: {
    programs.fd = {
      enable = true;
      hidden = true;
      ignores = [
        ".git/"
      ];
    };
  };
}

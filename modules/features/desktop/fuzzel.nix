{
  self,
  inputs,
  ...
}: {
  flake.homeModules.fuzzel = {
    programs.fuzzel = {
      enable = true;
    };
  };
}

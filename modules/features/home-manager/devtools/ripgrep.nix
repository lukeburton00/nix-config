{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-ripgrep = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.ripgrep = {
        enable = true;
        arguments = [
          "--hidden"
          "--glob=!.git/*"
        ];
      };
    };
  };
}

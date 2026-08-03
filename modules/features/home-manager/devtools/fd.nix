{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-fd = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.fd = {
        enable = true;
        hidden = true;
        ignores = [
          ".git/"
        ];
      };
    };
  };
}

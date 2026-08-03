{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev-yazi = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf config.devtools.enable {
      programs.yazi = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          mgr = {
            show_hidden = true;
          };
        };
      };
    };
  };
}

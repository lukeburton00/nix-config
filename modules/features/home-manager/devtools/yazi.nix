{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.yazi = {
    lib,
    config,
    ...
  }: {
    options = {
      yazi.enable = lib.mkEnableOption "enables yazi";
    };

    config = lib.mkIf config.yazi.enable {
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

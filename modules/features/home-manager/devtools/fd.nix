{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.fd = {
    lib,
    config,
    ...
  }: {
    options = {
      fd.enable = lib.mkEnableOption "enables fd";
    };

    config = lib.mkIf config.fd.enable {
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

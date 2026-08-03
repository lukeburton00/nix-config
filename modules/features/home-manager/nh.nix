{
  self,
  inputs,
  username,
  ...
}: {
  flake.modules.homeManager.nh = {
    lib,
    config,
    ...
  }: {
    options = {
      nh.enable = lib.mkEnableOption "enables nh nix helper";
    };

    config = lib.mkIf config.nh.enable {
      programs.nh = {
        enable = true;
      };
    };
  };
}

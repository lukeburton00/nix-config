{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.nvidia = {
    lib,
    config,
    ...
  }: {
    options = {
      nvidia.enable = lib.mkEnableOption "enables nvidia support";
    };

    config = lib.mkIf config.nvidia.enable {
      hardware = {
        graphics.enable = true;
        nvidia = {
          open = true;
          modesetting.enable = true;
          powerManagement.enable = true;
        };
      };
      services.xserver.videoDrivers = ["nvidia"];

      boot.kernelParams = ["nvidia.NVreg_TemporaryFilePath=/var/tmp"];
    };
  };
}

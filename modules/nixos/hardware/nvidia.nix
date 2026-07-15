{
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement = true;
    };
  };
  services.xserver.videoDrivers = ["nvidia"];
}

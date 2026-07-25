{osConfig, ...}: let
  monitors = osConfig.monitors;
in {
  services.mako = {
    enable = true;
    settings = {
      anchor = "bottom-right";
      default-timeout = "5000";
      output = monitors.primary;
    };
  };
}

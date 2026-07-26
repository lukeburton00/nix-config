{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kanshi = {osConfig, ...}: let
    monitors = osConfig.monitors;
  in {
    services.kanshi = {
      enable = true;
      settings = [
        {
          profile.name = "default";
          profile.outputs = [
            {
              criteria = monitors.secondary;
              mode = "2560x1440@60";
              position = "0,0";
              transform = "90";
            }
            {
              criteria = monitors.primary;
              mode = "3440x1440@144";
              position = "1440,525";
            }
          ];
        }
      ];
    };
  };
}

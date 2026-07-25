{
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "default";
        profile.outputs = [
          {
            criteria = "DP-3";
            mode = "2560x1440@60";
            position = "0,0";
            transform = "90";
          }
          {
            criteria = "DP-4";
            mode = "3440x1440@144";
            position = "1440,525";
          }
        ];
      }
    ];
  };
}

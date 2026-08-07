{ self, inputs, ... }: {
  flake.modules.homeManager.nh = {
    programs.nh.enable = true;
  };
}

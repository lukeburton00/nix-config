let
  username = "lukeburton";
in
  {
    self,
    inputs,
    ...
  }: {
    flake.modules.homeManager.${username} = {
      imports = with self.modules.homeManager; [
        base
        development
        ghostty
        nh
        podman
        work
        aerospace
      ];
    };
  }

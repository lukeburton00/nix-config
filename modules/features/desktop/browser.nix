{
  self,
  inputs,
  ...
}: {
  flake.homeModules.librewolf = {
    programs.librewolf = {
      enable = true;
      settings = {
        "privacy.resistFingerprinting" = false;
      };
    };
  };
  flake.darwinModules.firefox = {
    homebrew.casks = [
      "firefox"
    ];
  };
}

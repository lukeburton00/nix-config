{
  self,
  inputs,
  ...
}: {
  flake.homeModules.firefox = {
    programs.firefox = {
      enable = true;
      profiles.default = {
        extensions.force = true;
        isDefault = true;
      };
    };
  };

  flake.darwinModules.firefox = {
    homebrew.casks = [
      "firefox"
    ];
  };
}

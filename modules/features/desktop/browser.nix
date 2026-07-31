{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.firefox = {
    programs.firefox = {
      enable = true;
      profiles.default = {
        extensions.force = true;
        isDefault = true;
      };
    };
  };

  flake.modules.darwin.firefox = {
    homebrew.casks = [
      "firefox"
    ];
  };
}

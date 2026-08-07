{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.firefox = {
    homebrew.casks = [
      "firefox"
    ];
  };
}

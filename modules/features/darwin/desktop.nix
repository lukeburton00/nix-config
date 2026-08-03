{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.desktop = {
    homebrew.casks = [
      "firefox"
      "ghostty"
    ];
  };
}

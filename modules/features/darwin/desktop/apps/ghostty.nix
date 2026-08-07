{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.ghostty = {
    homebrew.casks = [
      "ghostty"
    ];
  };
}

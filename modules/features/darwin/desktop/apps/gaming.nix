{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.gaming = {
    homebrew.casks = [
      "discord"
      "steam"
    ];
  };
}

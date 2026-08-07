{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.fonts = {
    homebrew.casks = [
      "font-maple-mono-nf"
    ];
  };
}

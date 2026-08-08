{
  flake.modules.nixos.font = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      maple-mono.NF
    ];
  };

  flake.modules.darwin.font = {pkgs, ...}: {
    homebrew.casks = [
      "font-maple-mono-nf"
    ];
  };
}

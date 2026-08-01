{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.nixSettings = {pkgs, ...}: {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nixpkgs.config.allowUnfree = true;

    nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 0d";
    };

    system.activationScripts.pruneOldGenerations.text = ''
      ${pkgs.nix}/bin/nix-env \
        --profile /nix/var/nix/profiles/system \
        --delete-generations +3 || true
    '';
  };

  flake.modules.darwin.nixSettings = {
    nix.enable = false;
    nixpkgs.config.allowUnfree = true;
  };
}

{pkgs, ...}: {
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
}

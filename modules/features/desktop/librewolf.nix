{
  self,
  inputs,
  ...
}: {
  flake.homeModules.librewolf = {
    programs.librewolf = {
      enable = true;
      package = null;
      settings = {
        "privacy.resistFingerprinting" = false;
      };
    };
  };
  flake.nixosModules.librewolf = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      librewolf
    ];
  };
  flake.darwinModules.librewolf = {
    homebrew.casks = [
      "librewolf"
    ];
  };
}

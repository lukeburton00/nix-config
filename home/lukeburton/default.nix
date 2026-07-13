{
  username,
  homeDirectory,
  ...
}: {
  imports = [
    ../../modules/home/core.nix
  ];
  home = {
    inherit username;
    inherit homeDirectory;
    stateVersion = "26.11";
  };
}

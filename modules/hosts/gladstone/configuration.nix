{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.gladstoneConfig = {username, ...}: {
    imports = with self.modules.darwin; [
      homeManager
      homebrew

      nixSettings
      fonts
      timezone

      podman

      firefox
      ghostty

      work
    ];

    system.stateVersion = 6;
  };
}

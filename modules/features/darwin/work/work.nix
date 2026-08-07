{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.work = {
    homebrew.casks = [
      "postman"
      "pgadmin4"

      "twingate"
      "microsoft-teams"
    ];

    homebrew.brews = [
      "libyaml"
    ];
  };
}

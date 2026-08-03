{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.work-tools = {
    homebrew.casks = [
      "postman"
      "twingate"
      "pgadmin4"
    ];
  };
}

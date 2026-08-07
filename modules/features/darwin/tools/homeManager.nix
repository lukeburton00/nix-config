{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.homeManager = {username, ...}: {
    imports = [
      inputs.home-manager.darwinModules.default
    ];

    system.primaryUser = username;
    users.users.${username}.home = "/Users/${username}";

    home-manager = {
      users.${username} = self.modules.homeManager.${username};
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {
        inherit self inputs;
      };
    };
  };
}

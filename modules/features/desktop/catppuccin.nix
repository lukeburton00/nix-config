{
  self,
  inputs,
  ...
}: {
  flake.homeModules.catppuccin = {
    imports = [
      inputs.catppuccin.homeModules.catppuccin
    ];
    catppuccin = {
      enable = true;
      autoEnable = true;

      firefox.profiles.default.force = true;
      firefox.force = true;
    };
  };
  flake.modules.nixos.catppuccin = {
    imports = [
      inputs.catppuccin.nixosModules.catppuccin
    ];
    catppuccin = {
      enable = true;
      autoEnable = true;
    };
  };
}

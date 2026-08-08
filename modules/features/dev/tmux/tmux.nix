{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev = {
    config,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      tmux
    ];

    home.file.".config/tmux" = {
      source = ./config;
      recursive = true;
    };
  };
}

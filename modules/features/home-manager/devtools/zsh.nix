{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.zsh = {
    lib,
    config,
    ...
  }: {
    options = {
      zsh.enable = lib.mkEnableOption "enables zsh";
    };

    config = lib.mkIf config.zsh.enable {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        shellAliases = {
          v = "nvim";
          c = "clear";
          l = "ls -A -p --color=auto | sort";
          nd = "nix develop --command zsh";
        };
        initContent = ''
          # Machine-local settings and secrets that should not be managed by Nix.
          [[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
        '';
      };
    };
  };
}

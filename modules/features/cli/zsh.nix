{
  self,
  inputs,
  ...
}: {
  flake.homeModules.zsh = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        v = "nvim";
        c = "clear";
        l = "ls -A -p --color=auto | sort";
        nd = "nix develop --command zsh -c tmux";
      };
      initContent = ''
        # Machine-local settings and secrets that should not be managed by Nix.
        [[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
      '';
    };
  };
}

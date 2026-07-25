{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      v = "nvim";
      c = "clear";
      l = "ls -A -p --color=auto | sort";
    };
  };
}

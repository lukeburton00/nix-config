{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.devtools = {pkgs, ...}: {
    imports = [
      self.modules.homeManager.nvim
      self.modules.homeManager.tmux
      self.modules.homeManager.zsh
    ];

    home.packages = with pkgs; [
      tree
      croc
    ];

    programs = {
      fd = {
        enable = true;
        hidden = true;
        ignores = [
          ".git/"
        ];
      };

      fzf = {
        enable = true;
        enableZshIntegration = true;
      };

      git = {
        enable = true;
        settings = {
          user = {
            name = "Luke Burton";
            email = "lukesburton19@gmail.com";
          };
          init.defaultBranch = "main";
        };
      };

      lazygit = {
        enable = true;
        enableZshIntegration = true;
      };

      lazyworktree = {
        enable = true;
        enableZshIntegration = true;
      };

      mise = {
        enable = true;
        enableZshIntegration = true;
      };

      pi-coding-agent = {
        enable = true;
        extraPackages = [pkgs.nodejs pkgs.bun];
        settings = {
        };
      };

      ripgrep = {
        enable = true;
        arguments = [
          "--hidden"
          "--glob=!.git/*"
        ];
      };

      starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          aws.disabled = true;
        };
      };

      yazi = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          mgr = {
            show_hidden = true;
          };
        };
      };

      zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

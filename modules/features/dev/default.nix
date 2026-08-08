{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev = {pkgs, ...}: {
    home.packages = with pkgs; [
      neovim

      croc
      stow
      tree
      tree-sitter
      gcc
      tmux-sessionizer

      lua-language-server
      stylua
      nil
      alejandra
      statix
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    programs = {
      devenv = {
        enable = true;
        enableZshIntegration = true;
      };

      direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };

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

      herdr = {
        enable = true;

        settings = {
          theme = {
            name = "nord";
          };

          experimental = {
            kitty_graphics = false;
            pane_history = false;
          };
        };
      };

      lazygit = {
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
          packages = [
            "npm:pi-web-access"
          ];
          hideThinkingBlock = true;
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

      zsh = {
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

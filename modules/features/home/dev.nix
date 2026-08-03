{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.dev = {pkgs, ...}: {
    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    home.packages = with pkgs; [
      croc
      neovim
      stow
      tree
      tree-sitter
      gcc
      lua-language-server
      stylua
      nil
      alejandra
      statix
      tmux-sessionizer
    ];

    programs = {
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

      tmux = {
        enable = true;
        baseIndex = 1;
        escapeTime = 200;
        mouse = true;
        focusEvents = true;
        shell = "${pkgs.zsh}/bin/zsh";

        plugins = with pkgs.tmuxPlugins; [
          nord
          vim-tmux-navigator
        ];

        extraConfig = ''
          set-option -a terminal-features 'xterm-256color:RGB'

          set -g status on
          set -g status-interval 1

          set -g status-position bottom

          bind-key -n C-M-n switch-client -n
          bind-key -n C-M-p switch-client -p
        '';
      };

      direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };

      ghostty = {
        enable = true;
        systemd.enable = !pkgs.stdenv.isDarwin;
        package =
          if pkgs.stdenv.isDarwin
          then null
          else pkgs.ghostty;

        settings = {
          "font-family" = "Maple Mono NF";
          "font-size" = 15;
          "quit-after-last-window-closed" = true;
          "term" = "xterm-256color";
          "theme" = "Nord Wave";
        };
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
        settings = {};
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

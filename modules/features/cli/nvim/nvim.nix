{
  self,
  inputs,
  ...
}: {
  flake.homeModules.nvim = {pkgs, ...}: {
    programs.neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
        # nix
        nil
        alejandra
        statix

        # lua
        stylua
        lua-language-server

        # typescript
        typescript-language-server
        prettierd
        eslint_d

        # golang
        gopls
        gofumpt
        golangci-lint
        goimports-reviser

        # ruby
        solargraph
        rubyfmt
        rubocop

        # c/cpp
        clang-tools

        # cmake
        neocmakelsp
        cmake-format
        cmake-lint

        # Rust
        clippy
        rustfmt
        rust-analyzer

        # odin
        ols
      ];

      plugins = with pkgs.vimPlugins; [
        vague-nvim
        mini-nvim
        nvim-lspconfig
        nvim-lint
        fyler-nvim
        conform-nvim
        Navigator-nvim
        fzf-lua
        gitsigns-nvim
      ];
    };

    xdg.configFile."nvim/init.lua".source = ./init.lua;
  };
}

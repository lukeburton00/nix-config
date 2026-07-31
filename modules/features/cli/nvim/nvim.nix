{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.nvim = {pkgs, ...}: {
    programs.neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
        tree-sitter

        # nix
        nil
        alejandra
        statix

        # lua
        stylua
        lua-language-server
      ];

      plugins = with pkgs.vimPlugins; [
        mini-nvim
        nvim-lspconfig
        nvim-lint
        fyler-nvim
        conform-nvim
        Navigator-nvim
        fzf-lua
        gitsigns-nvim
        nvim-treesitter.withAllGrammars
      ];

      initLua = builtins.readFile ./init.lua;
    };
  };
}

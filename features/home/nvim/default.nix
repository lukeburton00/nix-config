{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nil
      alejandra
      statix
      stylua
      lua-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      vague-nvim
      mini-nvim
      nvim-lspconfig
      nvim-lint
      fyler-nvim
      conform-nvim
      Navigator-nvim
      gitsigns-nvim
    ];
  };

  xdg.configFile."nvim/init.lua".source = ./init.lua;
}

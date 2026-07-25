{
  programs.nvf.settings.vim = {
    options = {
      autoread = true;
      backup = false;
      clipboard = "unnamedplus";
      expandtab = true;
      hlsearch = false;
      incsearch = true;
      number = true;
      scrolloff = 8;
      shiftwidth = 4;
      showmode = false;
      showtabline = 0;
      signcolumn = "yes";
      smartindent = true;
      softtabstop = 4;
      swapfile = false;
      tabstop = 4;
      termguicolors = true;
      undofile = true;
      updatetime = 50;
      winborder = "rounded";
      wrap = false;
    };

    luaConfigRC.leader-keymaps = ''
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "
    '';
  };
}

{ lib, ... }: {
  programs.nvf.settings.vim = {
    autocmds = [
      {
        event = ["FileChangedShellPost"];
        callback = lib.generators.mkLuaInline ''
          function()
            vim.notify("File reloaded from disk", vim.log.levels.INFO, { title = "AutoRead" })
          end
        '';
      }
    ];

    luaConfigRC.autoread-timer = ''
      vim.o.autoread = true
      local autoread_timer = assert(vim.uv.new_timer())
      autoread_timer:start(
        2000,
        2000,
        vim.schedule_wrap(function()
          if vim.fn.getcmdwintype() == "" and vim.fn.mode() ~= "c" then
            pcall(vim.cmd.checktime)
          end
        end)
      )
    '';
  };
}

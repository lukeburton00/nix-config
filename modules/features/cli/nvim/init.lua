vim.o.nu = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.updatetime = 50
vim.o.showmode = false
vim.o.showtabline = 0
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
vim.o.autoread = true
vim.diagnostic.config({ virtual_text = true })

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

require("nvim-treesitter").setup({
	highlight = { enable = true },
})

map("n", "Q", "<nop>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

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

vim.api.nvim_create_autocmd("FileChangedShellPost", {
	callback = function()
		vim.notify("File reloaded from disk", vim.log.levels.INFO, { title = "AutoRead" })
	end,
})

-- Mini
local mini_pick = require("mini.pick")
mini_pick.setup()
vim.ui.select = mini_pick.ui_select

require("mini.icons").setup()
MiniIcons.tweak_lsp_kind()

require("mini.pairs").setup()
require("mini.move").setup()
require("mini.cmdline").setup()
require("mini.completion").setup()
require("mini.surround").setup()

vim.keymap.set("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
vim.keymap.set("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })
vim.keymap.set("i", "<CR>", function()
	return vim.fn.pumvisible() == 1 and "\25" or "\r"
end, { expr = true })
vim.keymap.set("i", "<Esc>", function()
	return vim.fn.pumvisible() == 1 and "\5\27" or "\27"
end, { expr = true })

-- fzf-lua
require("fzf-lua").setup({
	keymap = {
		fzf = {
			["tab"] = "down",
			["btab"] = "up",
		},
	},
})

map("n", "<leader>f", function()
	require("fzf-lua").files()
end, { desc = "Search files" })

map("n", "<leader>l", function()
	require("fzf-lua").live_grep()
end, { desc = "Live grep" })

map("n", "<leader>r", function()
	require("fzf-lua").lsp_finder()
end, { desc = "LSP finder" })

-- gitsigns
require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 500,
	},
})

-- LSP
vim.lsp.enable({
	"lua_ls",
	"ols",
	"gopls",
	"solargraph",
	"nil_ls",
	"clangd",
	"rust_analyzer",
	"neocmake",
	"ts_ls",
})

vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME .. "/lua",
					vim.env.VIMRUNTIME .. "/lua/vim/lsp",
					"${3rd}/luv/library",
					"${3rd}/busted/library",
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gk", vim.diagnostic.open_float)

-- Lint
require("lint").linters_by_ft = {
	go = { "golangcilint" },
	ruby = { "rubocop" },
	nix = { "statix" },
	c = { "clangtidy" },
	cpp = { "clangtidy" },
	cmake = { "cmake_lint" },
	rust = { "clippy" },
	typescript = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
	callback = function()
		vim.defer_fn(function()
			require("lint").try_lint()
		end, 0)
	end,
})

-- Fyler
require("fyler").setup({
	integrations = {
		icon = "mini_icons",
	},
	extensions = {
		git = { enabled = true },
		watcher = { enabled = true },
	},
	ui = {
		hidden_items = {
			switches = {},
		},
	},
})

map("n", "<leader>e", function()
	require("fyler").toggle()
end, { desc = "Toggle file explorer" })

-- Conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofumpt", "goimports-reviser" },
		ruby = { "rubyfmt" },
		nix = { "alejandra" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cmake = { "cmake_format" },
		rust = { "rustfmt" },
		typescript = { "prettierd" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500 }
	end,
	formatters = {
		["goimports-reviser"] = {
			prepend_args = {
				"-company-prefixes",
				os.getenv("COMPANY_PREFIX"),
				"-imports-order",
				"std,project,company,general",
			},
		},
	},
})

vim.api.nvim_create_user_command("FormatDisable", function()
	vim.g.disable_autoformat = true
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

require("Navigator").setup()

map("n", "<C-h>", "<cmd>NavigatorLeft<CR>")
map("n", "<C-j>", "<cmd>NavigatorDown<CR>")
map("n", "<C-k>", "<cmd>NavigatorUp<CR>")
map("n", "<C-l>", "<cmd>NavigatorRight<CR>")

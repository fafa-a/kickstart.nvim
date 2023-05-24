-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = "yes"

-- relative line numbers
vim.opt.relativenumber = true

-- space before end of 'viewport'
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- font family for neovide
vim.opt.guifont = { "Monolisa Nerd Font Mono", ":h12" }

-- height prompt command
vim.opt.cmdheight = 0

-- window same width
vim.opt.equalalways = true

-- set plit opening windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- indent
-- vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2

-- Set background blurry
-- vim.api.nvim_command([[
--      augroup ChangeBackgroudColour
--        autocmd colorscheme * :hi normal guibg=#0d1926b8
--      augroup END
-- ]])

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd([[colorscheme catppuccin-latte]])

-- Prettier
vim.g.ale_fixers = {
	javascript = { "prettier" },
	typescript = { "prettier" },
	typescriptreact = { "prettier" },
	javascriptreact = { "prettier" },
	svelte = { "prettier" },
	astro = { "prettier" },
	json = { "prettier" },
	css = { "prettier" },
	scss = { "prettier" },
	html = { "prettier" },
	markdown = { "prettier" },
	yaml = { "prettier" },
	graphql = { "prettier" },
	vue = { "prettier" },
	lua = { "stylua" },
}
vim.g.ale_fix_on_save = 1
vim.g.ale_linters_explicit = 1

-- astro
vim.filetype.add({ extension = { astro = "astro" } })
vim.g.astro_typescript = "enable"

-- svelte
vim.g.vim_svelte_plugin_use_typescript = 1
vim.g.vim_svelte_plugin_load_full_syntax = 1

-- format and save
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })

-- hanldes escape key & fixed copilot suggestion
vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("n", "<C-s>", ":w<CR>:Format<CR>", { silent = true })

-- close current buffer
vim.keymap.set("n", "<leader>c", ":bd<CR>", { silent = true })

-- buffer navigation
vim.keymap.set("n", "<S-h>", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true })

-- lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })

-- toggle nvim-tree explorer
vim.keymap.set("n", "<leader>x", ":Neotree toggle<CR>", { silent = true })

--disable arrow keys
vim.keymap.set("n", "<up>", "<nop>", { silent = true })
vim.keymap.set("n", "<down>", "<nop>", { silent = true })
vim.keymap.set("n", "<left>", "<nop>", { silent = true })
vim.keymap.set("n", "<right>", "<nop>", { silent = true })

-- keymap for moving
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })

--trouble settings
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- copilot accept suggestion with tab
vim.keymap.set("i", "<tab>", function()
	require("copilot.suggestion").accept()
	-- Put cursor on next line.
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, false, true), "n", false)
end, { desc = "[copilot] accept suggestion", silent = true })


-- harpoon settings
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>aa", mark.add_file)
vim.keymap.set("n", "<C-n>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-u>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-i>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-o>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-p>", function() ui.nav_file(4) end)


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

vim.diagnostic.config({ virtual_text = false })

-- indent
--vim.opt.tabstop = 2
--vim.opt.softtabstop = 2
--vim.opt.shiftwidth = 2

-- Set background blurry
-- vim.api.nvim_command([[
--      augroup ChangeBackgroudColour
--        autocmd colorscheme * :hi normal guibg=#0d1926b8
--      augroup END
-- ]])

-- Set colorscheme
vim.o.termguicolors = true

vim.cmd.colorscheme 'catppuccin-latte'

-- set back up and swap file directory
vim.opt.swapfile = false
vim.opt.backup = false
local home = os.getenv("HOME")
local backupDir = home .. "/.nvim/tmp/"
vim.opt.directory = backupDir
vim.opt.undofile = true

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
	rust = { "rustfmt" },
}
vim.g.ale_linters = { rust = { "cargo" } }
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
vim.keymap.set("n", "<S-b>", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "<S-n>", ":bnext<CR>", { silent = true })

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

vim.keymap.set("n", "<S-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<S-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<S-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<S-4>", function() ui.nav_file(4) end)

-- lsp lines
vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- lspsaga
local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occureences of the hovered word for the entire file
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
--keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

--git conflict
-- co — choose ours
-- ct — choose theirs
-- cb — choose both
-- c0 — choose none
-- ]x — move to previous conflict
-- [x — move to next conflict
--
-- use ripgrep to search
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<leader>gc", live_grep_args_shortcuts.grep_word_under_cursor)
vim.keymap.set("v", "<leader>gs", live_grep_args_shortcuts.grep_visual_selection)


--lualine setup
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', },
		lualine_c = { 'filename' },
		lualine_x = { 'diff' ,'diagnostic'},
		lualine_y = {
			{
				'datetime',
				-- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
				style = '%d/%m %H:%M'
			}
		},
		lualine_z = { 'location' },
	},
}

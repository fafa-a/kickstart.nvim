local map = vim.keymap.set
-- -- format and save
map("n", "<C-s>", ":w<CR>", { silent = true })

-- hanldes escape key & fixed copilot suggestion
map("i", "<C-c>", "<Esc>")
-- map("n", "<C-s>", ":w<CR>:Format<CR>", { silent = true })

-- close current buffer
map("n", "<leader>c", ":bd<CR>", { silent = true })

-- buffer navigation
map("n", "<S-b>", ":bprev<CR>", { silent = true })
map("n", "<S-n>", ":bnext<CR>", { silent = true })

-- lazygit
map("n", "<leader>gg", ":LazyGit<CR>", { silent = true })

-- toggle nvim-tree explorer
map("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })

--disable arrow keys
map("n", "<up>", "<nop>", { silent = true })
map("n", "<down>", "<nop>", { silent = true })
map("n", "<left>", "<nop>", { silent = true })
map("n", "<right>", "<nop>", { silent = true })

-- keymap for moving
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })
map("n", "<C-h>", "<C-w>h", { silent = true })

--trouble settings
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- copilot accept suggestion with tab
map("i", "<tab>", function()
	require("copilot.suggestion").accept()
	-- Put cursor on next line.
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, false, true), "n", false)
end, { desc = "[copilot] accept suggestion", silent = true })


-- lsp lines
map("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- lspsaga

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occureences of the hovered word for the entire file
map("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
--map("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
map("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
map("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
-- Diagnostic jump with filters such as only jumping to an error
map("n", "[E", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
map("n", "]E", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Call hierarchy
map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
map({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

-- use ripgrep to search
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
map("n", "<leader>gc", live_grep_args_shortcuts.grep_word_under_cursor)
map("v", "<leader>gs", live_grep_args_shortcuts.grep_visual_selection)

-- -- harpoon settings
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<leader>aa", mark.add_file)
map("n", "<C-n>", ui.toggle_quick_menu)

map("n", "<C-;>", function() ui.nav_file(1) end)
map("n", "<C-'>", function() ui.nav_file(2) end)
map("n", "<S-3>", function() ui.nav_file(3) end)
map("n", "<S-4>", function() ui.nav_file(4) end)



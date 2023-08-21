local opt = vim.opt
-- Decrease update time
opt.updatetime = 1000
vim.wo.signcolumn = 'yes'

opt.completeopt = { 'menu', 'menuone', 'noselect' }
-- relative line numbers
opt.relativenumber = true

-- confirm before closing unsaved buffer
opt.confirm = true

-- search acting like modern browsers
opt.incsearch = true

-- space before end of 'viewport'
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.smoothscroll = true

-- font family for neovide
opt.guifont = { 'Monolisa Nerd Font Mono', ':h12' }

-- height prompt command
opt.cmdheight = 0

-- window same width
opt.equalalways = true

-- set plit opening windows
opt.splitbelow = true
opt.splitright = true

-- test indent linebreak
opt.breakindent = true
vim.opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

vim.diagnostic.config { virtual_text = false }

-- Set background blurry
-- vim.api.nvim_command([[
--      augroup ChangeBackgroudColour
--        autocmd colorscheme * :hi normal guibg=#0d1926b8
--      augroup END
-- ]])

-- Set colorscheme
opt.termguicolors = true

vim.cmd.colorscheme 'catppuccin-latte'

-- -- set back up and swap file directory
opt.swapfile = false
-- opt.backup = false
local home = os.getenv 'HOME'
local backupDir = home .. '/.nvim/tmp/'
vim.opt.directory = backupDir
opt.undofile = true

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
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = { 'diff', '' },
    lualine_y = {
      {
        'datetime',
        -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
        style = '%d/%m %H:%M',
      },
    },
    lualine_z = { 'location' },
  },
}

require('bufferline').setup {
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
  },
  version = '*',
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
}

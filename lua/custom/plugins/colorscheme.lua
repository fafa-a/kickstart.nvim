return {
	{ "catppuccin/nvim", as = "catpuccin" },
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
			})
		end,
	},
	{ "frenzyexists/aquarium-vim" },
	{ "olimorris/onedarkpro.nvim" },
	{"ramojus/mellifluous.nvim"},
	{
        'maxmx03/fluoromachine.nvim',
        config = function ()
         local fm = require 'fluoromachine'

         fm.setup {
	    brightness = 0.05,
            --glow = true,
            theme = 'fluoromachine',
         }

        end
    },
	{
	  'uloco/bluloco.nvim',
	  lazy = false,
	  priority = 1000,
	  dependencies = { 'rktjmp/lush.nvim' },
	  config = function()
	    -- your optional config goes here, see below.
	  end,
	},
	{'rmehri01/onenord.nvim'},
	{'Mofiqul/vscode.nvim'},
	{'nyoom-engineering/oxocarbon.nvim'},
	{'humanoid-colors/vim-humanoid-colorscheme'}
}

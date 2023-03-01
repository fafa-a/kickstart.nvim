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
	{ "olimorris/onedarkpro.nvim" }
}

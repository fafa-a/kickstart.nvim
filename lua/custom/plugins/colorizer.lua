return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"css",
			"javascript",
			"javascriptreact",
			html = {
				mode = "foreground",
			},
			"lua",
			"vim",
			"typescript",
			"typescriptreact",
			"json",
			"rust",
		})
	end
}

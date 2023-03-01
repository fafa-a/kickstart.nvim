return {
	"Pocco81/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			debounce_delay = 1000,
			-- your config goes here
			-- or just leave it empty :)
		})
	end,
}

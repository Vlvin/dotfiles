return {
	"https://github.com/OXY2DEV/markview.nvim",
	config = function()
		require("markview").setup({
			typst = {
				enable = false,
			},
		})
	end,
}

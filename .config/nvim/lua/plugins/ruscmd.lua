return {
	"https://github.com/aveplen/ruscmd.nvim",
	config = function()
		require("ruscmd").setup({
			-- provide ex-command abbreviation
			-- example: ':й' -> ':q'
			abbreviations = true,

			-- provide NORMAL-mode translation
			-- example: 'ц' -> 'w'
			keymaps = true,
		})
	end,
}

return {
	{
		"https://github.com/folke/tokyonight.nvim",
		opts = {
			transparent = vim.useropts.transparent,
		},
	},
	{
		"https://github.com/catppuccin/nvim",
		-- opts = {
		-- 	transparent_background = true,
		-- },
	},
	{
		"https://github.com/f4z3r/gruvbox-material.nvim",
		opts = {
			background = {
				transparent = vim.useropts.transparent,
			},
			contrast = "hard",
		},
	},
	{
		"https://github.com/navarasu/onedark.nvim",
		opts = {
			style = "darker",
			transparent = vim.useropts.transparent,
			lualine = {
				transparent = vim.useropts.transparent,
			},
		},
	},
}

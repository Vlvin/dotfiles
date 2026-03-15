return {
	"https://github.com/stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<C-f>"] = "actions.select",
				["l"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = { "actions.close", mode = "n" },
				["<C-l>"] = "actions.refresh",
				["h"] = { "actions.parent", mode = "n" },
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { function() vim.cmd.lcd(require("oil").get_current_dir()) end, mode = "n" },
				["~"] = { function() vim.cmd.lcd(require("oil").get_current_dir()) end, opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			view_options = {
				show_hidden = false,
			},
			float = {
				padding = 2,
				max_width = 60,
				max_height = 30,
				border = "rounded",
			},
		})
		vim.keymap.set("n", "<leader>of", function()
			local curbufpath = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
			local dir = vim.fn.expand("%:h")
			if string.gmatch(curbufpath, "term://.*")() then
				dir = vim.fn.getcwd()
			end
			require("oil").open(dir)
		end, { desc = "[O]pen [F]iles" })
	end,
}

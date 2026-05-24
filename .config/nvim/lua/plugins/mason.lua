return {
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "https://github.com/mason-org/mason.nvim", opts = {} },
	config = function()
		local ensure_installed = vim.tbl_keys(require("servers"))
		for filetype, opts in pairs(require("formatters")) do
      if opts.autoinstall ~= false then
        vim.list_extend(ensure_installed, opts.formatters)
      end
		end
		require("mason-tool-installer").setup({
			ensure_installed = vim.tbl_filter(function(tbl)
				return tbl.autoinstall == false
			end, ensure_installed),
		})
	end,
}

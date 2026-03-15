return {
	"https://github.com/stevearc/conform.nvim",
	config = function()
		local formatters_by_ft = require("formatters")
    -- add lsp servers cause they have format capabilities
		-- for name, opt in pairs(require("servers")) do
		-- 	if opt.filetypes ~= nil then
		-- 		local truename = opt.name or name
		-- 		for _, filetype, _ in ipairs(opt.filetypes) do
		-- 			formatters_by_ft[filetype] = formatters_by_ft[filetype] or {}
		-- 			formatters_by_ft[filetype] = vim.list_extend(formatters_by_ft[filetype], { truename })
		-- 		end
		-- 	end
		-- end
    -- add formatters 
		-- for filetype, names in pairs(require("formatters")) do
		-- 	formatters_by_ft[filetype] = formatters_by_ft[filetype] or {}
		-- 	formatters_by_ft[filetype] = vim.list_extend(formatters_by_ft[filetype], names)
		-- end
		require("conform").setup({
			formatters_by_ft = formatters_by_ft,
		})
	end,
}

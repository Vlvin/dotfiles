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
      formatters_by_ft = vim.tbl_map(
        function(tbl)
          return {
            unpack(tbl.formatters),
            timeout_ms = tbl.timeout_ms,
            lsp_format = tbl.lsp_format,
            quiet = tbl.quiet,
            stop_after_first = tbl.stop_after_first
          }
        end, formatters_by_ft),
      --@field timeout_ms? integer Time in milliseconds to block for formatting. Defaults to 1000. No effect if async = true.
      --@field lsp_format? conform.LspFormatOpts Configure if and when LSP should be used for formatting. Defaults to "never".
      --@field quiet? boolean Don't show any notifications for warnings or failures. Defaults to false.
      --@field stop_after_first? boolean Only run the first available formatter in the list. Defaults to false.
    })
  end,
}

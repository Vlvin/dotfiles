-- Fidget
return {
	"https://github.com/j-hui/fidget.nvim",
	opts = {
    lsp = {
      log_handler = true
    },
    notification = {
      override_vim_notify = true
    }
  },
	-- config = function(opts)
	-- 	require("fidget").setup(opts)
	-- end,
}

return {
	"https://github.com/Saghen/blink.cmp",
	dependencies = {
		{
			"https://github.com/L3MON4D3/LuaSnip",
		},
		{
			"https://github.com/folke/lazydev.nvim",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					-- "LazyVim"
				},
			},
		},
	},
	version = "v1.7.0",
	config = function()
		local blink = require("blink.cmp")

		blink.setup({
			snippets = { preset = "luasnip" },
			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				per_filetype = {
					lua = { inherit_defaults = true, "lazydev" },
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			signature = {
				enabled = true,
			},
      keymap = {
        ['<C-k>'] = false
      }
		})

		vim.keymap.set("i", "<M-d>", function()
			blink.scroll_documentation_down(4)
		end, { desc = "Scroll documentation down" })
		vim.keymap.set("i", "<M-u>", function()
			blink.scroll_documentation_up(4)
		end, { desc = "Scroll documentation down" })

		for name, opt in pairs(require("servers")) do
			opt.capabilities = blink.get_lsp_capabilities(opt.capabilities)
			opt.cmd = opt.cmd or { name }
			---@type fun(client: vim.lsp.Client, bufnr: integer)
			local custom_attach = function(client, bufnr)
				if client:supports_method("textDocument/inlayHint", bufnr) then
					vim.keymap.set("n", "<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }), { bufnr })
					end, { desc = "[T]oggle inlay[H]ints" })
				end
        -- if client:supports_method("textDocument/documentHighlight", bufnr) then
        --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI'}, {
        --     desc = "Clear Symbol Highlight On Move",
        --     buffer = bufnr,
        --     callback = function ()
        --       vim.lsp.buf.clear_references()
        --       vim.lsp.buf.document_highlight()
        --     end
        --   })
        -- end
			end
			opt.on_attach = opt.on_attach or custom_attach
			if opt.name ~= nil then
				name = opt.name
			end
			vim.lsp.config(name, opt)
			vim.lsp.enable(name)
		end
	end,
}

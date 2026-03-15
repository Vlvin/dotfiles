return {
	"https://github.com/ibhagwan/fzf-lua",
	dependencies = {
		"https://github.com/stevearc/conform.nvim",
	},
	config = function()
		require("fzf-lua").setup({
			keymap = {
				builtin = {

					["<M-S-d>"] = "preview-page-down",
					["<M-S-u>"] = "preview-page-up",
					["<M-d>"] = "preview-down",
					["<M-u>"] = "preview-up",
				},
			},
      previewers = {
        builtin = {
          snacks_image = {
            enabled = true,
            inline_render = true
          }
        }
      }
		})
		FzfLua.register_ui_select()
		vim.keymap.set("n", "<leader>sd", FzfLua.lsp_workspace_diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sf", FzfLua.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sS", FzfLua.lsp_document_symbols, { desc = "[S]earch [S]ymbols" })
		vim.keymap.set("n", "<leader>ss", FzfLua.lsp_workspace_symbols, { desc = "[S]earch [s]ymbols" })
		vim.keymap.set("n", "<leader>sb", FzfLua.buffers, { desc = "[S]earch [B]uffers" })
		vim.keymap.set("n", "<leader>sg", FzfLua.live_grep, { desc = "[S]earch [G]rep" })
		vim.keymap.set("n", "<leader>sh", FzfLua.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", FzfLua.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>pc", FzfLua.colorschemes, { desc = "[P]review [C]olorsheme" })
		vim.keymap.set("n", "<leader>sm", FzfLua.man_pages, { desc = "[S]earch [M]anual" })
		vim.keymap.set("n", "<leader>st", "<CMD>TodoFzfLua<CR>", { desc = "[S]earch [T]odos" })
		vim.keymap.set("n", "<leader>gd", FzfLua.lsp_definitions, { desc = "[G]oto [d]efinition" })
		vim.keymap.set("n", "<leader>gi", FzfLua.lsp_implementations, { desc = "[G]oto [i]mplementation" })
		vim.keymap.set("n", "<leader>gr", FzfLua.lsp_references, { desc = "[G]oto [R]eferences" })
		vim.keymap.set("n", "<leader>gf", require("conform").format, { desc = "[G]o [f]ormat" })
		vim.keymap.set("n", "grf", vim.lsp.buf.format, { desc = "[G]o [f]ormat" })
		vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, { desc = "[G]o reveal [S]ignature :))" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })
		vim.keymap.set("n", "<leader>ca", FzfLua.lsp_code_actions, { desc = "[C]ode [A]ction" })
		vim.keymap.set("i", "<M-s>", vim.lsp.buf.signature_help, { desc = "show [S]ignature :))" })
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics jumplist" })
	end,
}

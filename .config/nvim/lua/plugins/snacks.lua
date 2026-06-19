return {
	"https://github.com/folke/snacks.nvim",
	config = function()
		require("snacks").setup({
			bigfile = {
				enabled = true,
			},
			quickfile = {
				enabled = true,
			},
			indent = {
				enabled = true,
			},
			rename = {
				enabled = true,
			},
			dim = {
				enabled = true,
			},
			image = {
				enabled = false,
				inline = true,
        math = {
          enabled = false
        }
			},
		})
		local Snacks = require("snacks")

		-- dim
		vim.keymap.set("n", "<leader>td", function()
			if Snacks.dim.enabled then
				Snacks.dim.disable()
			else
				Snacks.dim.enable()
			end
		end, { desc = "[T]oggle [D]im" })

		-- --
		-- -- picker
		-- local picker = nil
		-- vim.keymap.set('n', '<leader>sd', function() picker = Snacks.picker.diagnostics() end,
		--   { desc = '[S]earch [D]iagnostics' })
		-- vim.keymap.set('n', '<leader>sf', function() picker = Snacks.picker.files() end, { desc = '[S]earch [F]iles' })
		-- vim.keymap.set('n', '<leader>sS', function() picker = Snacks.picker.lsp_symbols() end,
		--   { desc = '[S]earch [S]ymbols' })
		-- vim.keymap.set('n', '<leader>ss', function() picker = Snacks.picker.lsp_workspace_symbols() end,
		--   { desc = '[S]earch [s]ymbols' })
		-- vim.keymap.set('n', '<leader>sb', function() picker = Snacks.picker.buffers() end, { desc = '[S]earch [B]uffers' })
		-- vim.keymap.set('n', '<leader>sg', function() picker = Snacks.picker.grep() end, { desc = '[S]earch [G]rep' })
		-- vim.keymap.set('n', '<leader>sh', function() picker = Snacks.picker.help() end, { desc = '[S]earch [H]elp' })
		-- vim.keymap.set('n', '<leader>sk', function() picker = Snacks.picker.keymaps() end, { desc = '[S]earch [K]eymaps' })
		-- vim.keymap.set('n', '<leader>pc', function() picker = Snacks.picker.colorschemes() end,
		--   { desc = '[P]review [C]olorsheme' })
		-- vim.keymap.set('n', '<leader>sm', function() picker = Snacks.picker.man() end, { desc = '[S]earch [M]anual' })
		-- vim.keymap.set('n', '<leader>st', function() picker = Snacks.picker.todo_comments() end,
		--   { desc = '[S]earch [M]anual' })
		-- vim.keymap.set('i', '<C-d>', function()
		--     vim.print(picker)
		--     if picker ~= nil
		--     then
		--       Snacks.picker.actions.list_scroll_down(picker)
		--     end
		--   end,
		--   { desc = 'Scroll preview [D]own' })
		-- vim.keymap.set('i', '<C-u>', function()
		--     vim.print(picker)
		--     if picker ~= nil
		--     then
		--       Snacks.picker.actions.list_scroll_up(picker)
		--     end
		--   end,
		--   { desc = 'Scroll preview [U]p' })
		--
		-- vim.keymap.set('n', '<leader>sm',function() picker = Snacks.picker.man() end, { desc = '[S]earch [M]anual' })

		-- lsp gotos
		-- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, { desc = '[G]oto [d]eclaration' })
		-- vim.keymap.set('n', '<leader>gD', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
		-- vim.keymap.set('n', '<leader>gD', Snacks.picker.lsp_declarations, { desc = '[G]oto [D]eclaration' })
		-- vim.keymap.set('n', '<leader>gd', Snacks.picker.lsp_definitions, { desc = '[G]oto [d]efinition' })
		-- vim.keymap.set('n', '<leader>gr', Snacks.picker.lsp_references, { desc = '[G]oto [R]eferences' })
		-- vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = '[G]o [f]ormat' })
		-- vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, { desc = '[G]o reveal [S]ignature :))' })
		-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[r]e[n]ame' })
		-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
		-- vim.keymap.set('i', '<M-s>', vim.lsp.buf.signature_help, { desc = 'show [S]ignature :))' })
		-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics jumplist' })
	end,
}

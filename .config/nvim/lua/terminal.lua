vim.api.nvim_create_autocmd({ "TermOpen" }, {
	desc = "No linenums in Term",
	callback = function(ev)
		vim.cmd([[ setlocal nonumber norelativenumber ]])
		vim.opt_local.listchars = { tab = "  ", trail = " ", nbsp = " " }
	end,
})
vim.api.nvim_create_autocmd({ "TermRequest" }, {
	desc = "Handles OSC 7 dir change requests",
	callback = function(ev)
		local val, n = string.gsub(ev.data.sequence, "\027]7;file://[^/]*", "")
		if n > 0 then
			-- OSC 7: dir-change
			local dir = val
			if vim.fn.isdirectory(dir) == 0 then
				vim.notify("invalid dir: " .. dir)
				return
			end
			vim.b[ev.buf].osc7_dir = dir
			if vim.api.nvim_get_current_buf() == ev.buf then
				vim.cmd.lcd(dir)
			end
		end
	end,
})

vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-CR>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

---@class vlvin.neovide.build_font.args
---@field font_name string
---@field font_size number

M = {}
---@type fun(args)
---@param args? vlvin.neovide.build_font.args
---@return string
function M.build_font(args)
	args = args or {}
	args.font_name = args.font_name or "FiraCode Nerd Font"
	args.font_size = args.font_size or 10
	M.font_name = args.font_name
	M.font_size = args.font_size
	return args.font_name .. ":h" .. args.font_size
end
vim.o.guifont = M.build_font({font_size = vim.useropts.font_size or 10})
local autogrp = vim.api.nvim_create_augroup("Neovide", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Neovide is a terminal",
	group = autogrp,
	callback = function(args)
		vim.cmd([[ term ]])
    vim.cmd([[ setlocal nonumber norelativenumber signcolumn=no ]])
    vim.opt_local.listchars = { tab = "  ", trail = " ", nbsp = " " }
		vim.cmd.startinsert()
	end,
})
vim.api.nvim_create_user_command("FontInc", function()
	local size = M.font_size + 1
	M.font_size = size
	vim.o.guifont = M.build_font({ font_size = size })
end, {})
vim.keymap.set({ "n", "t", "i", "v" }, "<C-+>", "<CMD>FontInc<CR>", { desc = "increase font size" })
vim.keymap.set({ "n", "t", "i", "v" }, "<C-=>", "<CMD>FontInc<CR>", { desc = "increase font size" })
vim.api.nvim_create_user_command("FontDec", function()
	local size = M.font_size - 1
	M.font_size = size
	vim.o.guifont = M.build_font({ font_size = size })
end, {})
vim.keymap.set({ "n", "t", "i", "v" }, "<C-->", "<CMD>FontDec<CR>", { desc = "increase font size" })
vim.useropts.transparent = false
vim.keymap.set({ "n", "t", "i", "v" }, "<C-S-v>", function()
	vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end)
return M

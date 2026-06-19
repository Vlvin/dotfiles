---@class vlvin.vim.useropts
---@field transparent boolean
---@field font_size number
---@field font_name string
vim.useropts = {}
require("opts")
require("terminal")
require("tmux")
if vim.g.neovide then
	require("neovide")
end

vim.opt.shellcmdflag = "-c"
vim.keymap.set({ "i", "v", "n" }, "<C-CR>", "<Esc>", { desc = "Exit any mode" })
vim.keymap.set("n", "<Esc>", "<CMD>nohl<CR>", { desc = "Discard last search highlight" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
vim.cmd.colorscheme("onedark")
-- require("langmapper").automapping({ global = true, buffer = true })

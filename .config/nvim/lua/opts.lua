-- regualr config
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.showmode = false
vim.g.mapleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.diagnostic.config({
	-- virtual_text = true,
	virtual_lines = true,
	underline = true,
	update_in_insert = false,
})

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
-- fold blocks
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldmethod = "expr"
--
-- Colors
vim.o.termguicolors = true
vim.opt.mouse = ""
vim.useropts.font_size = 12
vim.useropts.transparent = true
-- vim.opt.cmdheight = 0

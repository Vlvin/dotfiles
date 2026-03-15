--Terminal
return {
  'https://github.com/akinsho/toggleterm.nvim',
  opts = {
    start_in_insert = true
  },
  config = function (opts)
    require("toggleterm").setup(opts)
    vim.keymap.set('n', "<leader>tt", ":ToggleTerm<CR>", { desc = "[T]oggle [T]erm"})
  end
}

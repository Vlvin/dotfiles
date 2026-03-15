return {
  'https://github.com/folke/which-key.nvim',
  opts = {
    preset = "modern"
  },
  -- @param opts require('which-key').Opts
  config = function(opts)
    require('which-key').setup(opts)
    vim.keymap.set('n', '<leader>?', function()
      require('which-key').show({ global = false })
    end, { desc = 'Local keymaps' })
  end
}

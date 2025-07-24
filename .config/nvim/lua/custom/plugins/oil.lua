return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      keymaps = {
        ['g?'] = { 'actions.show_help', mode = 'n' },
        ['<C-f>'] = 'actions.select',
        ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
        ['<C-t>'] = { 'actions.select', opts = { tab = true } },
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = { 'actions.close', mode = 'n' },
        ['<C-l>'] = 'actions.refresh',
        ['-'] = { 'actions.parent', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        ['`'] = { 'actions.cd', mode = 'n' },
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        ['gx'] = 'actions.open_external',
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
        ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
      },
      view_options = {
        show_hidden = false,
      },
      float = {
        padding = 2,
        max_width = 60,
        max_height = 30,
        border = 'rounded',
      },
    }
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}

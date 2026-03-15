return {
  'https://github.com/mrjones2014/smart-splits.nvim',
  lazy = false,
  config = function()
    local ssplits = require('smart-splits')
    ssplits.setup()

    -- vim.keymap.set('n', '<C-h>', ssplits.move_cursor_left, { desc = "move focus to pane on the left" })
    -- vim.keymap.set('n', '<C-j>', ssplits.move_cursor_down, { desc = "move focus to pane below" })
    -- vim.keymap.set('n', '<C-k>', ssplits.move_cursor_up, { desc = "move focus to pane above" })
    -- vim.keymap.set('n', '<C-l>', ssplits.move_cursor_right, { desc = "move focus to pane on the left" })

    vim.keymap.set('n', '<C-h>', ssplits.move_cursor_left, { desc = "move focus to pane on the left" })
    vim.keymap.set('n', '<C-j>', ssplits.move_cursor_down, { desc = "move focus to pane below" })
    vim.keymap.set('n', '<C-k>', ssplits.move_cursor_up, { desc = "move focus to pane above" })
    vim.keymap.set('n', '<C-l>', ssplits.move_cursor_right, { desc = "move focus to pane on the left" })

    vim.keymap.set('n', '<C-S-h>', ssplits.swap_buf_left, { desc = "move focus to pane on the left" })
    vim.keymap.set('n', '<C-S-j>', ssplits.swap_buf_down, { desc = "move focus to pane below" })
    vim.keymap.set('n', '<C-S-k>', ssplits.swap_buf_up, { desc = "move focus to pane above" })
    vim.keymap.set('n', '<C-S-l>', ssplits.swap_buf_right, { desc = "move focus to pane on the left" })

    vim.keymap.set('n', '<M-h>', ssplits.resize_left, { desc = "resize pane left" })
    vim.keymap.set('n', '<M-j>', ssplits.resize_down, { desc = "resize pane down" })
    vim.keymap.set('n', '<M-k>', ssplits.resize_up, { desc = "resize pane up" })
    vim.keymap.set('n', '<M-l>', ssplits.resize_right, { desc = "resize pane right" })
  end
}

return
--   {
--   'monkoose/neocodeium',
--   config = function()
--     local ncodeium = require 'neocodeium'
--     ncodeium.setup()
--     vim.keymap.set('i', '<C-c>ca', ncodeium.accept, { desc = '[C]odeium [A]ccept' })
--     vim.keymap.set('i', '<C-c>cw', ncodeium.accept_word)
--     vim.keymap.set('i', '<C-c>cl', ncodeium.accept_line)
--     vim.keymap.set('i', '<C-c>cn', function()
--       ncodeium.cycle_or_complete(-1)
--     end)
--     vim.keymap.set('i', '<C-c>cc', function()
--       ncodeium.clear()
--     end)
--   end,
-- }
{
  'Exafunction/windsurf.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('codeium').setup {

      virtual_text = {
        enabled = true,
      },
      key_bindings = {
        accept = '<Tab>',
        accept_word = '<C-c>cw',
        accept_line = '<C-c>cl',
        next = '<C-c>cn',
        prev = '<C-c>cp',
        dismiss = '<Esc>',
      },
    }
    -- require('codeium.virtual_text').setup {
    --   virtual_text = {
    --     filetypes = {
    --       python = true,
    --       markdown = false,
    --     },
    --     default_filetype_enabled = true,
    --   },
    -- }
  end,
}

-- Nvim Debug Adapter Protocol
return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    -- "mxsdev/nvim-dap-vscode-js",
  },
  config = function()
    vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint)
  end,
}

-- dap installer
--

local M = {

  'jay-babu/mason-nvim-dap.nvim',
}

M.event = 'VeryLazy'
M.dependencies = {
  'rcarriga/nvim-dap-ui',
  'nvim-neotest/nvim-nio',
  'jay-babu/mason-nvim-dap.nvim',
  'theHamsta/nvim-dap-virtual-text',
  'mfussenegger/nvim-dap',
}
M.config = function()
  local mason_dap = require 'mason-nvim-dap'
  local dap = require 'dap'
  local dap_ui = require 'dapui'
  local dap_vt = require 'nvim-dap-virtual-text'

  dap_vt.setup()
  local daps = {}
  for dap, _ in pairs(require('mason-nvim-dap.mappings.source').nvim_dap_to_package) do
    daps[dap] = dap
  end
  local assert_dap = function(dap_name)
    assert(daps[dap_name] or false, 'No such dap: ' .. dap_name)
    return daps[dap_name]
  end

  local configurations = {
    javascript = { dap = assert_dap 'firefox' },
    typescript = { dap = assert_dap 'firefox' },
    python = { dap = assert_dap 'python' },
    c = { dap = assert_dap 'cppdbg' },
    cpp = { dap = assert_dap 'cppdbg' },
    bash = { dap = assert_dap 'bash' },
  }
  -- remove duplicates from enseure installed
  local seen = {}
  for _, v in pairs(configurations) do
    seen[v.dap] = true
  end
  local ensure_installed = vim.tbl_map(function(k)
    return k
  end, vim.tbl_keys(seen))
  seen = {}

  mason_dap.setup {
    ensure_installed = ensure_installed, -- automatically install languages,
    automatic_installation = true,
    automatic_setup = true,
    handlers = {
      function(config)
        require('mason-nvim-dap').default_setup(config)
      end,
    },
  }
  for language, info in ipairs(configurations) do
    dap.configurations[info.dap] = {
      {
        type = 'executable',
        command = vim.fn.exepath(info.dap),
      },
    }
  end

  dap_ui.setup()

  vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
  dap.listeners.before.attach.dapui_config = dap_ui.open
  dap.listeners.before.launch.dapui_config = dap_ui.open
  dap.listeners.before.event_terminated.dapui_config = dap_ui.close
  dap.listeners.before.event_exited.dapui_config = dap_ui.close
  -- keys
  local map = function(key, action, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, key, action, { desc = desc })
  end
  map('<leader>dt', function()
    require('dap').toggle_breakpoint()
  end, 'Toggle Breakpoint')
  map('<leader>dc', function()
    require('dap').continue()
  end, 'Continue')
  map('<leader>di', function()
    require('dap').step_into()
  end, 'Step Into')
  map('<leader>do', function()
    require('dap').step_over()
  end, 'Step Over')
  map('<leader>du', function()
    require('dap').step_out()
  end, 'Step Out')
  map('<leader>dr', function()
    require('dap').repl.open()
  end, 'Open REPL')
  map('<leader>dl', function()
    require('dap').run_last()
  end, 'Run Last')
  map('<leader>dq', function()
    require('dap').terminate()
    require('dapui').close()
    require('nvim-dap-virtual-text').toggle()
  end, 'Terminate')
  map('<leader>db', function()
    require('dap').list_breakpoints()
  end, 'List Breakpoints')
  map('<leader>de', function()
    require('dap').set_exception_breakpoints { 'all' }
  end, 'Set Exception Breakpoints')
end

return M

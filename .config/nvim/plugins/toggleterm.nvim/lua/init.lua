local M = {}
M.terminal = {
  buffer = nil,
  window = nil,
}
function M.open_terminal()
  -- open terminal
  vim.cmd 'split'
  M.terminal.window = vim.api.nvim_get_current_win()
  M.terminal.buffer = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(M.terminal.window, M.terminal.buffer)
  vim.cmd 'terminal'
end
function M.toggle_terminal()
  -- toggle terminal
end

return M

vim.keymap.set("n", "<C-f>n", "<CMD>tabnext<CR>")
vim.keymap.set("n", "<C-f>p", "<CMD>tabprev<CR>")
vim.keymap.set("n", "<C-f>x", "<CMD>tabclose<CR>")
vim.keymap.set("n", "<C-f>c", function()
  vim.cmd.tabnew()
  vim.cmd.lcd("~")
end)

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    -- if vim.restart ~= true then
      vim.system({ "rm", vim.session_name })
    -- end
  end,
  desc = "Handle nvim session properly"
})

local function get_file_name(sock)
  local i, _ = string.find(sock, '/[^/]+$')
  return string.sub(sock, (i or 0) + 1)
end

local function get_session_index()
  local args = vim.v.argv
  local index = nil
  for _index, value in pairs(args) do
    index = _index
    if value == vim.v.servername then
      break
    end
  end
  return index
end

local sess_argv_index = get_session_index()
vim.session_name = sess_argv_index and vim.v.argv[sess_argv_index] or vim.v.servername

vim.api.nvim_create_user_command("Restart", function()
  local args = vim.v.argv
  local index = sess_argv_index
  if index then
    args[index] = vim.session_name
  end
  -- vim.restart = true
  -- vim.notify("" .. vim.restart)
  -- vim.cmd.restart()
  -- vim.cmd([[ connect! ]] .. vim.session_name)
end, {})


vim.api.nvim_create_user_command("SessName", function()
  local sess_filename = get_file_name(vim.session_name)
  local sess_filepath = vim.fn.stdpath("cache") .. "/sessions/"
  local new_sess_filename = nil
  vim.ui.input({
    prompt = "New session name: "
  }, function(input)
    vim.session_name = sess_filepath .. get_file_name(input)
  end)

  vim.system({ "mv", sess_filepath .. sess_filename, vim.session_name })
end, { desc = "Change session name" })
vim.api.nvim_create_user_command("Sess", function(args)
  ---@type string|nil
  local cwd = vim.fn.stdpath("cache") .. "/sessions/"
  local cmd = "find " .. vim.fn.stdpath("cache") .. "/sessions/" .. " -type f -o -type l -o -type s"
  local sockets = vim.fn.systemlist(
    'find ' ..
    vim.fn.stdpath('cache') ..
    '/sessions/' .. ' -type f -o -type l -o -type s -maxdepth 1'
  )
  FzfLua.fzf_exec(sockets, {
    previewer = false,
    fzf_opts = {
      ['--preview-window'] = 'hidden'
    },
    actions = {
      ['default'] = function(selected)
        local cache = vim.fn.stdpath('cache')
        local _, e, _ = string.find(cache, os.getenv("HOME") or "")
        cache = string.sub(cache, (e or 0) + 2) .. "/sessions/"
        local in_system = string.len(string.gmatch(cache, "nvim/sessions/.*")()) ~= 0
        if selected[1] then
          vim.session_name = selected[1]
          if in_system then
            vim.cmd([[connect ]] .. selected[1])
          else
            vim.cmd([[connect! ]] .. selected[1])
          end
        end
        return { false }
      end,
    },
  })
end, { desc = "Change neovim session" })

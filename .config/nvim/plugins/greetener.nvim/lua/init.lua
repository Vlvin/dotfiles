return {
  ---@param opts? { name: string }
  setup = function(opts)
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        opts = opts or { name = 'world' }
        print('Hello ' .. opts.name)
      end,
    })
  end,
}

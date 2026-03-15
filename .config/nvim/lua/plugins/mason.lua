return {
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = { 'https://github.com/mason-org/mason.nvim', opts = {} },
  config = function()
    local ensure_installed = vim.tbl_keys(require("servers"))
    for filetype, names in pairs(require("formatters")) do
      vim.list_extend(ensure_installed, names)
    end
    require("mason-tool-installer").setup {
      ensure_installed = ensure_installed
    }
end
}

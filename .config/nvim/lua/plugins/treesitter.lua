return {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "*",
    branch = "main",
    config = function()
      require('nvim-treesitter').setup()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "html", "c", "bash", "lua", "python", "typst" },
        auto_install = true
      })
    end
  }

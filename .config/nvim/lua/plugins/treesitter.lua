-- return {}
return {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require('nvim-treesitter').setup()
    end
  }

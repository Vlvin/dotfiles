return {
  'ricardicus/nvim-magic',
  config = function()
    require('nvim-magic').setup()
  end,
  requires = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
}

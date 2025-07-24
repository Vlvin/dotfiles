-- Typst renderer
return {
  'PartyWumpus/typst-concealer',
  config = function()
    local typst = require 'typst-concealer'
    typst.setup {
      enabled_by_default = true,
      styling_type = 'colorscheme',
    }
  end,
  event = 'VeryLazy',
}

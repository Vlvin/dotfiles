-- ColorTable

-- here you can put colorschemes
local colorschemes = {
  -- name of theme variable must be same as theme name
  -- so I can't sucesfully rename catppuccin
  catppuccin = {
    -- lazy plugin link
    'catppuccin/nvim',
    -- colorscheme config
    opts = {
      flavour = 'macchiato',
      transparent_background = false,
    },
  },
  tokyonight = {
    'folke/tokyonight.nvim',
    opts = {
      styles = {
        style = 'night',
        comments = { italic = false }, -- disable italics in comments
        transparent = true,
      },
    },
  },
  kanagawa = {
    'rebelot/kanagawa.nvim',
    opts = {
      theme = 'wave',
      transparent = true,
    },
  },
  ['gruvbox-material'] = { 'sainnhe/gruvbox-material' },
}

colorschemes_list = function()
  return vim.tbl_keys(colorschemes)
end

-- To change your coloscheme just change this variable to any index in colorschemes (e.g. tokyonight, catppuccin)
local fallback = 'default'
local name = 'tokyonight'
local link = colorschemes[name][1]
local opts = colorschemes[name].opts

return {
  link,
  name = name,
  priority = 1000,
  config = function()
    local success = pcall(function()
      require(name).setup(opts or {})
    end)
    if not success then
      print('Failed to load colorscheme ' .. name, 'error')
      vim.cmd.colorscheme(fallback)
    else
      vim.cmd.colorscheme(name)
    end
  end,
}

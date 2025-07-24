-- Neorg is NEOvim ORGanisation mode for taking notes in better way
return {
  'nvim-neorg/neorg',
  lazy = false,
  vertion = '*',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/Documents/Notes',
              code_ideas = '~/Documents/CodeIdeas',
              job_search = '~/Documents/JobSearch',
            },
            default_workspace = 'notes',
          },
        },
        ['core.integrations.treesitter'] = {},
      },
    }
  end,
  run = ':Neorg sync-parsers',
  requires = 'nvim-lua/plenary.nvim',
}

-- Autocompletion plugin
return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = '*',
  config = function()
    local blink = require 'blink-cmp'
    blink.setup {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-e: Hide menu
      -- C-k: Toggle signature help
      --
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'default' },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
        providers = {
          codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
        },
      },

      snippets = {
        preset = 'default',
      },

      completion = {
        list = {
          selection = {
            -- auto_insert = function(_)

            --   local success, status = pcall(require('neocodeium').get_status)
            --   if success then
            --     success = status ~= 0
            --   end
            --   return success
            -- end,
          },
        },
        menu = {
          draw = {
            columns = {
              { 'kind_icon' },
              { 'label', 'label_description', gap = 1 },
            },
          },
        },
      },

      signature = {
        enabled = true,
      },

      -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    }
    vim.keymap.set('i', '<C-d>', function()
      blink.scroll_documentation_down(4)
    end, { desc = 'Scroll blink documentation down' })
    vim.keymap.set('i', '<C-u>', function()
      blink.scroll_documentation_up(4)
    end, { desc = 'Scroll blink documentation down' })
  end,
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  -- opts = {
  --   -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
  --   -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
  --   -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
  --   --
  --   -- All presets have the following mappings:
  --   -- C-space: Open menu or open docs if already open
  --   -- C-e: Hide menu
  --   -- C-k: Toggle signature help
  --   --
  --   -- See the full "keymap" documentation for information on defining your own keymap.
  --   keymap = { preset = 'default' },
  --
  --   appearance = {
  --     -- Sets the fallback highlight groups to nvim-cmp's highlight groups
  --     -- Useful for when your theme doesn't support blink.cmp
  --     -- Will be removed in a future release
  --     use_nvim_cmp_as_default = true,
  --     -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
  --     -- Adjusts spacing to ensure icons are aligned
  --     nerd_font_variant = 'mono',
  --   },
  --
  --   -- Default list of enabled providers defined so that you can extend it
  --   -- elsewhere in your config, without redefining it, due to `opts_extend`
  --   sources = {
  --     default = { 'lsp', 'path', 'snippets', 'buffer' },
  --   },
  --
  --   snippets = {
  --     preset = 'default',
  --   },
  --
  --   completion = {
  --     list = {
  --       selection = {
  --         auto_insert = function(_)
  --           local result = pcall(require('neocodeium').get_status)
  --           if result then
  --             local plugin, _ = require('neocodeium').get_status()
  --             result = plugin ~= 0
  --           end
  --           return result
  --         end,
  --       },
  --     },
  --     menu = {
  --       draw = {
  --         columns = {
  --           { 'kind_icon' },
  --           { 'label', 'label_description', gap = 1 },
  --         },
  --       },
  --     },
  --   },
  --
  --   signature = {
  --     enabled = true,
  --   },
  --
  --   -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
  --   -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  --   -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --   --
  --   -- See the fuzzy documentation for more information
  --   fuzzy = { implementation = 'prefer_rust_with_warning' },
  -- },
  opts_extend = { 'sources.default' },
}

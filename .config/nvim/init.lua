require 'opts'
if vim.g.neovide then
  vim.o.guifont = "Monocraft Nerd Font"
end

vim.keymap.set('t', '<C-q>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-CR>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set({ 'i', 'v' }, '<C-CR>', '<Esc>', { desc = 'Exit any mode' })
vim.keymap.set('n', '<Esc>', '<CMD>nohl<CR>', { desc = 'Discard last search highlight' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)


local servers = {
  ["lua-language-server"] = {
    name = "lua_ls",
    cmd = { "lua-language-server" },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT"
        },
        diagnostics = {
          unusedLocalExclude = { "_*" },
          globals = { "vim", "describe", "it", "before_each", "after_each" },
          disable = { "missing-fields", "unused-local" },
          workspaceDelay = -1,
          workspaceEvent = "OnSave",
        },
        hint = {
          enable = true,
          arrayIndex = "Enable",
          setType = true,
        },
        workspace = {
          -- library = {
          --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          --   [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          --   [vim.fn.stdpath("config") .. "/lua"] = true,
          -- },
        },
        semantic = {
          keyword = true,
        },
      },
      -- Lua = {
      -- 	version = 'LuaJIT',
      -- }
    },
  },
  -- ruff = {
  -- 	cmd = { "ruff", "server" },
  -- 	filetypes = { 'python' },
  -- 	root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  -- },
  basedpyright = {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { 'python' },
    root_markers = { '.venv', 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    settings = {
      basedpyright = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticsMode = 'openFilesOnly',
        }
      }
    }
  },
  clangd = {
    cmd = { 'clangd' },
    root_markers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c', 'cpp' }
  },
  tinymist = {
    filetypes = { 'typst' }
  }
}

---@class (exact) Pack.Spec
---@field src string
---@field opts? table
---@field config? function(table?)
---@field nosetup? boolean
-- -@field build? string
--
-- ---@type table
-- PACK = {
--   ---@type (Pack.Spec)[]
--   _packages = {},
--   ---comment
--   ---@param packages (string|Pack.Spec)[]
--   add = function(packages)
--     for _, package in pairs(packages) do
--       -- local name = PACK._package_module_name(package.src or package or "")
--       if type(package) == "string" then
--         table.insert(PACK._packages, {  package })
--       elseif type(package) == "table" and package.src ~= nil then
--         table.insert(PACK._packages, package)
--       else
--         error("Expected string or Pack.Spec, got " .. type(package))
--       end
--     end
--     vim.pack.add(vim.tbl_values(PACK._packages))
--     for _, package in pairs(PACK._packages) do
--       -- if package.build != nil then
--       --   vim.cmd "!"..package.build
--       -- end
--       local name = PACK._package_module_name(package.src or package or "")
--       if package.nosetup then
--         goto continue
--       end
--       if package.config ~= nil then
--         local success, result = pcall(package.config, package.opts or {})
--         if not success then
--           error("Something went wrong in config() of " .. name)
--         end
--       else
--         local plugin = require(name)
--         if plugin.setup == nil then
--           vim.print("no setup() in " .. name)
--           goto continue
--         end
--         local success, result = pcall(require(name).setup, package.opts or {})
--         if not success then
--           error("Something went wrong in " .. name .. ".setup()")
--         end
--       end
--       ::continue::
--     end
--   end,
--   ---@param name string
--   ---plugin name
--   del = function(name)
--     -- PACK._packages[name] = nil
--     vim.pack.del({ name })
--   end,
--   ---@param src string
--  -- NOTE: it may not work if link contains . like in 'mini.surround' but module is also 'mini.surround'
--   _package_module_name = function(src)
--     if type(src) == "table" then
--       vim.print(src)
--       return ''
--     end
--     return string.match(src, '/([^/.]*)[.$]*[^/]*$')
--   end
-- }
--


require('lazy').setup({
  --   {  'https://github.com/vhyrro/luarocks.nvim',
  --   opts = {
  -- rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim", "pathlib.nvim", "nvim-treesitter-legacy-api" }
  --   },
  --   config = function(opts)
  --     require('luarocks-nvim').setup(opts)
  --     end
  -- },
  'https://github.com/folke/tokyonight.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  { 'https://github.com/windwp/nvim-autopairs',     opts = {} },
  { 'https://github.com/nvim-lualine/lualine.nvim', opts = {} },
  { 'https://github.com/OXY2DEV/markview.nvim',     opts = {} },
  { 'https://github.com/folke/todo-comments.nvim',  opts = {} },
  {
    'https://github.com/kawre/leetcode.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {}
  },
  {
{
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  opts = {}, -- lazy.nvim will implicitly calls `setup {}`
}  },
  {
    'https://github.com/nvim-neorg/neorg',
    lazy = false,
    version = "*",
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/Documents/Notes',
              code_ideas = '~/Documents/CodeIdeas',
              job_search = '~/Documents/JobSearch',
              education = '~/Documents/RAU/',
              writings = '~/Documents/Writings/',
            },
            default_workspace = 'notes',
          },
        },
        ['core.integrations.treesitter'] = {},
      },
    },
    -- config = true
  },
  -- {
  --    "https://github.com/pxwg/math-conceal.nvim",
  --   build = "make lua51"
  --   opts = { enabled = true }
  -- },
  {
    'https://github.com/stevearc/overseer.nvim', opts = {},
  },
  {
    'https://github.com/stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        keymaps = {
          ['g?'] = { 'actions.show_help', mode = 'n' },
          ['<C-f>'] = 'actions.select',
          ['l'] = 'actions.select',
          ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
          ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
          ['<C-t>'] = { 'actions.select', opts = { tab = true } },
          ['<C-p>'] = 'actions.preview',
          ['<C-c>'] = { 'actions.close', mode = 'n' },
          ['<C-l>'] = 'actions.refresh',
          ['h'] = { 'actions.parent', mode = 'n' },
          ['-'] = { 'actions.parent', mode = 'n' },
          ['_'] = { 'actions.open_cwd', mode = 'n' },
          ['`'] = { 'actions.cd', mode = 'n' },
          ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
          ['gs'] = { 'actions.change_sort', mode = 'n' },
          ['gx'] = 'actions.open_external',
          ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
          ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
        },
        view_options = {
          show_hidden = false,
        },
        float = {
          padding = 2,
          max_width = 60,
          max_height = 30,
          border = 'rounded',
        },
      }
      vim.keymap.set('n', '<leader>of', '<CMD>Oil<CR>', { desc = '[O]pen [F]iles' })
    end
  },
  {
    'https://github.com/folke/snacks.nvim',
    config = function()
      require('snacks').setup({
        picker = {
          enabled = true
        },
        bigfile = {
          enabled = true
        },
        quickfile = {
          enabled = true
        },
        indent = {
          enabled = true
        },
        rename = {
          enabled = true
        },
        terminal = {
          enabled = true
        },
        dim = {
          enabled = true
        },
        image = {
          enabled = true,
          math = {
            enabled = false,
            typst = {
              tpl = [[
          #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
          #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
          #set text(size: 12pt, fill: rgb("${color}"))
          #set par(leading: 0.65em)
          ${header}
          ${content}]]
            }
          },
          doc = {
            inline = false,
          }

        },
      })
      local Snacks = require 'snacks'

      -- dim
      vim.keymap.set('n', '<leader>td', function()
        if Snacks.dim.enabled then
          Snacks.dim.disable()
        else
          Snacks.dim.enable()
        end
      end, { desc = '[T]oggle [D]im' })

      -- terminal
      vim.keymap.set({ 't', 'n' }, '<leader>tt', function() Snacks.terminal.toggle() end, { desc = '[T]oggle [T]erm' })

      -- picker
      local picker = nil
      vim.keymap.set('n', '<leader>sd', function() picker = Snacks.picker.diagnostics() end,
        { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sf', function() picker = Snacks.picker.files() end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sb', function() picker = Snacks.picker.buffers() end, { desc = '[S]earch [B]uffers' })
      vim.keymap.set('n', '<leader>sg', function() picker = Snacks.picker.grep() end, { desc = '[S]earch [G]rep' })
      vim.keymap.set('n', '<leader>sh', function() picker = Snacks.picker.help() end, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', function() picker = Snacks.picker.keymaps() end, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>pc', function() picker = Snacks.picker.colorschemes() end,
        { desc = '[P]review [C]olorsheme' })
      vim.keymap.set('n', '<leader>sm', function() picker = Snacks.picker.man() end, { desc = '[S]earch [M]anual' })
      vim.keymap.set('n', '<leader>st', function() picker = Snacks.picker.todo_comments() end,
        { desc = '[S]earch [M]anual' })
      vim.keymap.set('i', '<C-d>', function()
          vim.print(picker)
          if picker ~= nil
          then
            Snacks.picker.actions.list_scroll_down(picker)
          end
        end,
        { desc = 'Scroll preview [D]own' })
      vim.keymap.set('i', '<C-u>', function()
          vim.print(picker)
          if picker ~= nil
          then
            Snacks.picker.actions.list_scroll_up(picker)
          end
        end,
        { desc = 'Scroll preview [U]p' })

      -- vim.keymap.set('n', '<leader>sm',function() picker = Snacks.picker.man() end, { desc = '[S]earch [M]anual' })


      -- lsp gotos
      -- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, { desc = '[G]oto [d]eclaration' })
      -- vim.keymap.set('n', '<leader>gD', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
      vim.keymap.set('n', '<leader>gD', Snacks.picker.lsp_declarations, { desc = '[G]oto [D]eclaration' })
      vim.keymap.set('n', '<leader>gd', Snacks.picker.lsp_definitions, { desc = '[G]oto [d]efinition' })
      vim.keymap.set('n', '<leader>gr', Snacks.picker.lsp_references, { desc = '[G]oto [R]eferences' })
      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = '[G]o [f]ormat' })
      vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, { desc = '[G]o reveal [S]ignature :))' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[r]e[n]ame' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
      vim.keymap.set('i', '<M-s>', vim.lsp.buf.signature_help, { desc = 'show [S]ignature :))' })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics jumplist' })
    end
  },
  {
    'https://github.com/folke/which-key.nvim',
    opts = {
      preset = "modern"
    },
    -- @param opts require('which-key').Opts
    config = function(opts)
      require('which-key').setup(opts)
      vim.keymap.set('n', '<leader>?', function()
        require('which-key').show({ global = false })
      end, { desc = 'Local keymaps' })
    end
  },
  {
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'https://github.com/mason-org/mason.nvim', opts = {} },
    opts = {
      ensure_installed = vim.tbl_keys(servers)
    }
  },
  { "https://github.com/justinsgithub/wezterm-types", nosetup = true },
  {
    "https://github.com/folke/lazydev.nvim",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "wezterm-types",      mods = { "wezterm" } },
        -- "LazyVim"
      }
    }
  },
  {
    'https://github.com/Saghen/blink.cmp',
    version = "v1.7.0",
    config = function()
      local blink = require 'blink.cmp'

      blink.setup({
        sources = {
          default = {
            "lsp", "path", "snippets", "buffer"
          },
          per_filetype = {
            lua = { inherit_defaults = true, "lazydev" },
          },
          providers = {
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              score_offset = 100,
            }
          }
        }
      })


      for name, opt in pairs(servers) do
        opt.capabilities = blink.get_lsp_capabilities(opt.capabilities)
        opt.cmd = opt.cmd or { name }
        if opt.name ~= nil then
          name = opt.name
        end
        vim.lsp.config(name, opt)
        vim.lsp.enable(name)
      end
    end
  },

  {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "master",
    config = function()
      require('nvim-treesitter').setup()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "html", "c", "bash", "lua", "python", "typst" },
        auto_install = true
      })
    end
  },
  {
    'https://github.com/mrjones2014/smart-splits.nvim',
    lazy = false,
    config = function()
      local ssplits = require('smart-splits')
      ssplits.setup()

      -- vim.keymap.set('n', '<C-h>', ssplits.move_cursor_left, { desc = "move focus to pane on the left" })
      -- vim.keymap.set('n', '<C-j>', ssplits.move_cursor_down, { desc = "move focus to pane below" })
      -- vim.keymap.set('n', '<C-k>', ssplits.move_cursor_up, { desc = "move focus to pane above" })
      -- vim.keymap.set('n', '<C-l>', ssplits.move_cursor_right, { desc = "move focus to pane on the left" })

      vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "move focus to pane on the left" })
      vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "move focus to pane below" })
      vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "move focus to pane above" })
      vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "move focus to pane on the left" })

      vim.keymap.set('n', '<M-h>', function() ssplits.resize_left(5) end, { desc = "resize pane left" })
      vim.keymap.set('n', '<M-j>', function() ssplits.resize_down(5) end, { desc = "resize pane down" })
      vim.keymap.set('n', '<M-k>', function() ssplits.resize_up(5) end, { desc = "resize pane up" })
      vim.keymap.set('n', '<M-l>', function() ssplits.resize_right(5) end, { desc = "resize pane right" })
    end
  },
  { 'https://github.com/nvim-mini/mini.surround',     opts = {} },
})



vim.cmd "colorscheme tokyonight"

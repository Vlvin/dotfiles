return {
	marksman = {
		cmd = { "marksman", "server" },
		filetypes = { "markdown", "markdown.mdx" },
		root_markers = { ".marksman.toml", ".git" },
	},
	["rust-analyzer"] = {
		filetypes = { "rust" },
		root_markers = { "Cargo.toml", ".git" },
		single_file_support = true,
		settings = {
			["rust-analyzer"] = {
				diagnostics = {
					enable = true,
				},
        inlayHints = {
          enable = true
        }
			},
		},
	},
	["lua-language-server"] = {
		name = "lua_ls",
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
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
	basedpyright = {
		cmd = { "basedpyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = { ".venv", "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
		settings = {
      -- python = {
      --   venvPath = ".venv"
      -- },
			basedpyright = {
				disableOrganizeImports = true,
				analysis = {
					typeCheckingMode = "basic",
					importFormat = "auto",
					autoCompletions = true,
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
	clangd = {
		cmd = { "clangd", "--completion-style=detailed" },
		root_markers = { ".clangd", "compile_commands.json" },
		filetypes = { "c", "cpp" },
	},
	tinymist = {
		filetypes = { "typst" },
	},
}

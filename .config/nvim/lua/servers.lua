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
					enable = true,
				},
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
	["asm-lsp"] = {
		filetypes = { "asm", "S", "s" },
		root_markers = { "main.asm", "Makefile", ".asm-lsp.toml", ".git" },
	},
	-- basedpyright = {
	--   cmd = { "basedpyright-langserver", "--stdio" },
	--   filetypes = { "python" },
	--   root_markers = { ".venv", "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
	--   settings = {
	--     -- python = {
	--     --   venvPath = ".venv"
	--     -- },
	--     basedpyright = {
	--       disableOrganizeImports = true,
	--       analysis = {
	--         typeCheckingMode = "basic",
	--         importFormat = "auto",
	--         autoCompletions = true,
	--         autoSearchPaths = true,
	--         useLibraryCodeForTypes = true,
	--       },
	--     },
	--   },
	-- },
	pyright = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = {
			".venv",
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile",
			"pyrightconfig.json",
			"ruff.toml",
			".ruff.toml",
			".git",
		},
		single_file_support = true,
		settings = {
			python = {
				venvPath = ".venv",
				disableOrganizeImports = true,
				analysis = {
					typeCheckingMode = "basic",
					importFormat = "auto",
					autoCompletions = true,
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "openFilesOnly",
				},
			},
		},
	},
	clangd = {
		cmd = { "clangd", "--completion-style=detailed" },
		root_markers = { ".clangd", "compile_commands.json" },
		filetypes = { "c", "cpp" },
		clangd = {
			semanticHighlighting = true,
		},
	},
	tinymist = {
		filetypes = { "typst" },
	},
	vtsls = {
		init_options = {
			hostInfo = "neovim",
			tsserver = {
				path = "/usr/lib/node_modules/typescript/lib",
			},
		},
		cmd = { "vtsls", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
		single_file_support = true,
	},
	-- cmake = {
	-- 	cmd = { "cmake-language-server" },
	-- 	filetypes = { "cmake" },
	-- 	root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
	-- 	init_options = {
	-- 		buildDirectory = "build",
	-- 	},
	-- },
	neocmake = {
		cmd = { "neocmakelsp", "stdio" },
		filetypes = { "cmake" },
		root_markers = { ".git", "build", "cmake" },
		single_file_support = true,
	},
}

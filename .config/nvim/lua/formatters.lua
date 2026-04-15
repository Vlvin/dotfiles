return {
	c = { "clang-format", lsp_format = "fallback" },
	cpp = { "clang-format", lsp_format = "fallback" },
	python = { "ruff", "black" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	lua = { "stylua", lsp_format = "fallback" },
	assembler = { "asmfmt" },
	rust = { "rustfmt", autoinstall = false },
	typst = { "typstyle" },
}

return {
  c = { formatters = { "clang-format" }, lsp_format = "fallback" },
  cpp = { formatters = { "clang-format" }, lsp_format = "fallback" },
  python = { formatters = { "black","ruff"  }, stop_after_first = false },
  javascript = { formatters = { "prettier" } },
  typescript = { formatters = { "prettier" } },
  lua = { formatters = { "stylua" }, lsp_format = "fallback" },
  assembler = { formatters = { "asmfmt" } },
  rust = { formatters = { "rustfmt" }, autoinstall = false },
  typst = { formatters = { "typstyle" } },
}

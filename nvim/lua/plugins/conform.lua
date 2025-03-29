return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters = {
        stylua = {
          append_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--collapse-simple-statement",
            "FunctionOnly",
          },
        },
      },
    },
  },
}

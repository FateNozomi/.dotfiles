MiniDeps.later(function()
  MiniDeps.add("stevearc/conform.nvim")
  require("conform").setup({
    formatters_by_ft = {
      html = { "prettierd", "prettier", stop_after_first = true },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = function(bufnr)
      -- Enable with a global or buffer-local variable
      if vim.g.enable_autoformat or vim.b[bufnr].enable_autoformat then
        return { timeout_ms = 500, lsp_format = "fallback" }
      end
    end,
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
  })

  vim.api.nvim_create_user_command("FormatEnable", function(args)
    if args.bang then
      -- FormatEnable! will enable formatting just for this buffer
      vim.b.enable_autoformat = true
    else
      vim.g.enable_autoformat = true
    end
  end, {
    desc = "Enable autoformat-on-save",
    bang = true,
  })

  vim.api.nvim_create_user_command("FormatDisable", function()
    vim.b.enable_autoformat = false
    vim.g.enable_autoformat = false
  end, {
    desc = "Disable autoformat-on-save",
  })

  vim.keymap.set({ "n", "x" }, "<leader>lf", '<Cmd>lua require("conform").format()<CR>', { desc = "Format" })
end)

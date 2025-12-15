_G.Config.now_if_args(function()
  MiniDeps.add("neovim/nvim-lspconfig")

  -- Use `:h vim.lsp.enable()` to automatically enable language server based on
  -- the rules provided by 'nvim-lspconfig'.
  -- Use `:h vim.lsp.config()` or 'after/lsp/' directory to configure servers.
  -- Uncomment and tweak the following `vim.lsp.enable()` call to enable servers.
  vim.lsp.enable({
    "lua_ls",
    "jsonls",
  })
end)

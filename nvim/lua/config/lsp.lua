vim.lsp.config("roslyn_ls", {
  cmd = {
    "/opt/roslyn/Microsoft.CodeAnalysis.LanguageServer",
    "--logLevel",
    "Information",
    "--extensionLogDirectory",
    vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
    "--stdio",
  },
})

vim.lsp.enable({
  "roslyn_ls",
  "jsonls",
  "lua_ls",
  "vtsls",
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  callback = function() vim.lsp.codelens.refresh({ bufnr = 0 }) end,
})

vim.diagnostic.config({
  virtual_lines = { current_line = true },
})

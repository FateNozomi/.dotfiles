vim.lsp.enable({
  "json_ls",
  "lua_ls",
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  callback = function() vim.lsp.codelens.refresh({ bufnr = 0 }) end,
})

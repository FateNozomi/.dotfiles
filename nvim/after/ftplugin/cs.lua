vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

vim.g.dotnet_errors_only = true
vim.g.dotnet_show_project_file = false
vim.cmd("compiler dotnet")

-- Fold with tree-sitter
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

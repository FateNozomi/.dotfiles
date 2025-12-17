-- Fold with tree-sitter
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

vim.g.dotnet_errors_only = true
vim.g.dotnet_show_project_file = false
vim.cmd("compiler dotnet")

if vim.fn.has("win32") == 1 then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
    .. "[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();"
    .. "$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    .. "$PSStyle.OutputRendering = 'PlainText';"
  vim.opt.shellpipe = "> %s 2>&1"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

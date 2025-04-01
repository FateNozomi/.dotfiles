require("config.settings")
require("config.lazy")
require("config.keymaps")

vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"

vim.diagnostic.config({
  virtual_lines = { current_line = true },
})

if not vim.g.vscode then
  vim.cmd.colorscheme("kanagawa")
  require("config.lsp")
end

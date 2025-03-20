require("config.settings")
require("config.lazy")
require("config.keymaps")

vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"

if not vim.g.vscode then
  vim.cmd.colorscheme("kanagawa")
end

require("config.settings")
require("config.lazy")
require("config.keymaps")

vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"

if not vim.g.vscode then
  vim.cmd.colorscheme("kanagawa")
end

if vim.g.neovide then
  vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h12"
end

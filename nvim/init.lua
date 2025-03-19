require("config.settings")
require("config.lazy")
require("config.keymaps")

if not vim.g.vscode then
  vim.cmd.colorscheme("kanagawa")
end

if vim.g.neovide then
  vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h12"
end

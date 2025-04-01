require("config.settings")
require("config.lazy")
require("config.keymaps")

if not vim.g.vscode then
  vim.cmd.colorscheme "catppuccin"
end

require("config.settings")
require("config.lazy")
require("config.keymaps")

vim.cmd.colorscheme "catppuccin"

if vim.g.vscode then
  vim.keymap.set('n', 'gd', "<CMD>lua require('vscode').action('editor.action.goToImplementation')<CR>")
  vim.keymap.set('n', 'gr', "<CMD>lua require('vscode').action('editor.action.goToReferences')<CR>")
  vim.keymap.set('n', '<leader>f', "<CMD>lua require('vscode').action('editor.action.formatDocument')<CR>")
end

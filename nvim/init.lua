require("config.settings")
require("config.lazy")

vim.cmd.colorscheme "catppuccin"

if vim.g.vscode then
  vim.keymap.set('n', 'gd', "<cmd>lua require('vscode').action('editor.action.goToImplementation')<CR>")
  vim.keymap.set('n', 'gr', "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>")
  vim.keymap.set('n', '<leader>f', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
end

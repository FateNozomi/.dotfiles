require("config.settings")
require("config.lazy")
require("config.keymaps")

if not vim.g.vscode then
  vim.cmd.colorscheme "catppuccin"
else
  vim.keymap.set('n', 'gr', "<CMD>lua require('vscode').action('editor.action.goToReferences')<CR>")
  vim.keymap.set('n', 'gI', "<CMD>lua require('vscode').action('editor.action.goToImplementation')<CR>")
  vim.keymap.set('n', '<leader>f', "<CMD>lua require('vscode').action('editor.action.formatDocument')<CR>")
end

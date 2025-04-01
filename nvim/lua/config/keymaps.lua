local map = vim.keymap.set

-- Clear default LSP keymaps
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR>", { desc = "Clear 'hlsearch'", silent = true })

-- Writes file
map("n", "<leader>w", "<CMD>w<CR>")

-- Copy to system clipboard
map("n", "<leader>y", '"+Y')
map("v", "<leader>y", '"+y')

-- Paste from system clipboard
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')

if not vim.g.vscode then
  map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, desc = "Terminal normal mode" })
  map("t", "<M-r>", [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true })
else
  map(
    "n",
    "<leader>ft",
    "<CMD>lua require('vscode').action('workbench.action.terminal.focus')<CR>",
    { desc = "Terminal" }
  )
end

-- LSP
if not vim.g.vscode then
  map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
  map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
  map("n", "gr", vim.lsp.buf.references, { desc = "References" })
  map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementations" })
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
  map("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format Buffer" })
else
  map("n", "gd", "<CMD>lua require('vscode').action('editor.action.revealDefinition')<CR>")
  map("n", "gr", "<CMD>lua require('vscode').action('editor.action.goToReferences')<CR>")
  map("n", "gI", "<CMD>lua require('vscode').action('editor.action.goToImplementation')<CR>")
  map({ "n", "v" }, "<leader>ca", "<CMD>lua require('vscode').action('editor.action.codeAction')<CR>")
  map("n", "<leader>fd", "<CMD>lua require('vscode').action('editor.action.formatDocument')<CR>")
end

map("n", "gR", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "gO", vim.lsp.buf.document_symbol, { desc = "Lists all symbols in the current buffer" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Display signature information" })

-- location list
map("n", "<leader>xl", vim.diagnostic.setloclist, { desc = "Location List" })

-- quickfix list
map("n", "<leader>xq", vim.diagnostic.setqflist, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- diagnostic
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Oil
if not vim.g.vscode then
  map("n", "<leader>-", "<CMD>Oil<CR>")
else
  map("n", "-", "<CMD>lua require('vscode').action('workbench.view.explorer')<CR>")
end

-- vscode Harpoon
if vim.g.vscode then
  map("n", "<leader>hh", "<CMD>lua require('vscode').action('harpoon-vscode.addToHarpoon')<CR>")
  map("n", "<C-h>", "<CMD>lua require('vscode').action('harpoon-vscode.goToHarpoon')<CR>")
  map("n", "<leader>he", "<CMD>lua require('vscode').action('harpoon-vscode.editHarpoon')<CR>")
end

-- vscode Bookmarks
if vim.g.vscode then
  map("n", "<leader>mm", "<CMD>lua require('vscode').action('bookmarks.toggle')<CR>")
  map("n", "<leader>ml", "<CMD>lua require('vscode').action('bookmarks.listFromAllFiles')<CR>")
end

-- vscode Centered Layout
if vim.g.vscode then
  map("n", "<leader>z", "<CMD>lua require('vscode').action('workbench.action.toggleCenteredLayout')<CR>")
end

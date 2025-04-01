local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<leader>n", "<CMD>nohlsearch<CR>")

-- Writes file
map("n", "<leader>w", "<CMD>w<CR>")

-- Copy to system clipboard
map("n", "<leader>y", '"+Y')
map("v", "<leader>y", '"+y')

-- Paste from system clipboard
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')

if not vim.g.vscode then
  map("n", "<leader>ft", "<CMD>terminal<CR>", { desc = "Terminal" })
  map("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal normal mode" })
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
  map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
  map("n", "gr", vim.lsp.buf.references, { desc = "Find All References" })
  map("n", "gI", vim.lsp.buf.implementation, { desc = "Find All Implementations" })
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
  map("n", "<leader>fd", vim.lsp.buf.format, { desc = "Formats buffer" })
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
map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Display signature information" })

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Oil
if not vim.g.vscode then
  map("n", "-", "<CMD>lua MiniFiles.open()<CR>")
  map("n", "<leader>-", "<CMD>Oil<CR>")
else
  map("n", "-", "<CMD>lua require('vscode').action('workbench.view.explorer')<CR>")
end

-- FzfLua
map("n", "<C-p>", "<CMD>FzfLua files<CR>")
map("n", "<leader>f?", "<CMD>FzfLua<CR>", { desc = "FzfLua Builtin" })
map("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>", { desc = "FzfLua Live Grep" })
map("n", "<leader>fb", "<CMD>FzfLua buffers<CR>", { desc = "FzfLua Buffers" })
map("n", "<leader>fo", "<CMD>FzfLua oldfiles<CR>", { desc = "FzfLua Oldfiles" })
map("n", "<leader>fh", "<CMD>FzfLua helptags<CR>", { desc = "FzfLua Help Tags" })

map("n", "<leader>la", "<CMD>FzfLua lsp_code_actions<CR>", { desc = "Code action" })
map("n", "<leader>lr", "<CMD>FzfLua lsp_references<CR>", { desc = "Find All References" })
map("n", "<leader>lI", "<CMD>FzfLua lsp_implementations<CR>", { desc = "Find All Implementations" })

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

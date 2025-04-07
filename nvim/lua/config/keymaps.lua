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
map("n", "<leader>w", "<CMD>w<CR>", { desc = "Write Buffer" })

-- Copy to system clipboard
map("n", "<leader>y", '"+yy', { desc = 'Yank line into "+' })
map("v", "<leader>y", '"+y', { desc = 'Yank highlighted text into "+' })

-- Paste from system clipboard
map("n", "<leader>p", '"+p', { desc = 'Paste text from "+ after the cursor' })
map("n", "<leader>P", '"+P', { desc = 'Paste text from "+ before the cursor' })
map("v", "<leader>p", '"+p', { desc = 'Replace text from "+ ' })

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, desc = "Terminal normal mode" })
map("t", "<M-r>", [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementations" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format Buffer" })

map("n", "gR", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "gO", vim.lsp.buf.document_symbol, { desc = "Lists all symbols in the current buffer" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Display signature information" })

-- location list
map("n", "<leader>xl", vim.diagnostic.setloclist, { desc = "Location List" })

-- quickfix list
map("n", "<leader>xq", vim.diagnostic.setqflist, { desc = "Quickfix List" })

-- diagnostic
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

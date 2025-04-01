local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<leader>n', '<CMD>nohlsearch<CR>')

-- Writes file
map('n', '<leader>w', '<CMD>w<CR>')

-- Copy to system clipboard
map('n', '<leader>y', '"+Y')
map('v', '<leader>y', '"+y')

-- Paste from system clipboard
map('n', '<leader>p', '"+p')
map('v', '<leader>p', '"+p')

-- LSP
map('n', 'grr', vim.lsp.buf.rename, { desc = 'Renames all references' })
map('n', 'gra', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', 'grn', vim.lsp.buf.references, { desc = 'Lists all the references' })
map('n', 'gri', vim.lsp.buf.implementation, { desc = 'Lists all the implementations' })
map('n', 'gO', vim.lsp.buf.document_symbol, { desc = 'Lists all symbols in the current buffer' })
map('i', '<C-s>', vim.lsp.buf.signature_help, { desc = 'Display signature information' })
map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Formats buffer' })

-- Oil
map('n', '<leader>-', '<CMD>Oil<CR>')

-- FzfLua
map('n', '<C-p>', '<CMD>FzfLua files<CR>')

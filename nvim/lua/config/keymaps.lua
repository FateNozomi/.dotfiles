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
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Find All References' })
map('n', 'gI', vim.lsp.buf.implementation, { desc = 'Find All Implementations' })
map('n', 'gA', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', 'gR', vim.lsp.buf.rename, { desc = 'Rename Symbol' })

map('n', 'gO', vim.lsp.buf.document_symbol, { desc = 'Lists all symbols in the current buffer' })
map('i', '<C-s>', vim.lsp.buf.signature_help, { desc = 'Display signature information' })
map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Formats buffer' })

-- Oil
map('n', '<leader>-', '<CMD>Oil<CR>')

-- FzfLua
map('n', '<C-p>', '<CMD>FzfLua files<CR>')
map('n', '<leader>f?', '<CMD>FzfLua<CR>', { desc = 'FzfLua Builtin' })

map('n', '<leader>la', '<CMD>FzfLua lsp_code_actions<CR>', { desc = 'Code action' })
map('n', '<leader>lr', '<CMD>FzfLua lsp_references<CR>', { desc = 'Find All References' })
map('n', '<leader>lI', '<CMD>FzfLua lsp_implementations<CR>', { desc = 'Find All Implementations' })

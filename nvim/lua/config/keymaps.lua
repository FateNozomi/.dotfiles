local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<leader>n', '<CMD>nohlsearch<CR>')

-- Writes file
map('n', '<leader>w', '<CMD>w<CR>')

-- Copy to system clipboard
map('n', '<leader>y', '"+Y')
map('v', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')

-- Oil
map('n', '<leader>-', '<CMD>Oil<CR>')

-- FzfLua
map('n', '<C-p>', '<CMD>FzfLua files<CR>')
map('n', '<C-k>', '<CMD>FzfLua<CR>')

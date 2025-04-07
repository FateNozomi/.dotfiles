local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable mouse mode
vim.opt.mouse = "a"

-- Make line numbers default
vim.opt.number = true

-- Replace <Tab> with <space>
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

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

if vim.g.vscode then
  -- vscode Terminal
  map(
    "n",
    "<leader>ft",
    "<CMD>lua require('vscode').action('workbench.action.terminal.focus')<CR>",
    { desc = "Terminal" }
  )

  -- vscode LSP
  map("n", "gd", "<CMD>lua require('vscode').action('editor.action.revealDefinition')<CR>")
  map("n", "gD", "<CMD>lua require('vscode').action('editor.action.revealDeclaration')<CR>")
  map("n", "gr", "<CMD>lua require('vscode').action('editor.action.goToReferences')<CR>")
  map("n", "gI", "<CMD>lua require('vscode').action('editor.action.goToImplementation')<CR>")
  map({ "n", "v" }, "<leader>ca", "<CMD>lua require('vscode').action('editor.action.codeAction')<CR>")
  map("n", "<leader>fd", "<CMD>lua require('vscode').action('editor.action.formatDocument')<CR>")

  -- vscode Explorer
  map("n", "-", "<CMD>lua require('vscode').action('workbench.view.explorer')<CR>")

  -- vscode Bookmarks
  map("n", "<leader>mm", "<CMD>lua require('vscode').action('bookmarks.toggle')<CR>")
  map("n", "<leader>ml", "<CMD>lua require('vscode').action('bookmarks.listFromAllFiles')<CR>")

  -- vscode Centered Layout
  map("n", "<leader>z", "<CMD>lua require('vscode').action('workbench.action.toggleCenteredLayout')<CR>")
end

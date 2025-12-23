MiniDeps.later(function()
  MiniDeps.add({
    source = "fatenozomi/vim-test",
    checkout = "dev",
  })
  vim.g["test#strategy"] = "neovim"

  -- t is for 'Test'
  vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Run Last (vim-test)" })
  vim.keymap.set("n", "<leader>tr", ":TestNearest<CR>", { desc = "Run Nearest (vim-test)" })
  vim.keymap.set("n", "<leader>tt", ":TestFile<CR>", { desc = "Run File (vim-test)" })
  vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { desc = "Visit File (vim-test)" })
end)

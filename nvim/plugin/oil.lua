Config.now(function()
  vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
  require("oil").setup({
    keymaps = {
      ["cd"] = { "actions.cd", mode = "n" },
    },
  })

  vim.keymap.set("n", "<leader>-", "<Cmd>Oil<CR>", { desc = "Oil Explorer" })
end)

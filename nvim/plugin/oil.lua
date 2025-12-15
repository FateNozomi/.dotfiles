MiniDeps.now(function()
  MiniDeps.add("stevearc/oil.nvim")
  require("oil").setup({
    keymaps = {
      ["cd"] = { "actions.cd", mode = "n" },
    },
  })

  vim.keymap.set("n", "<leader>-", "<Cmd>Oil<CR>", { desc = "Oil Explorer" })
end)

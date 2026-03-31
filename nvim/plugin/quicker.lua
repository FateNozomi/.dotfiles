Config.later(function()
  vim.pack.add({ "https://github.com/stevearc/quicker.nvim" })
  require("quicker").setup({
    keys = {
      { ">", "<Cmd>lua require('quicker').expand()<CR>", desc = "Expand quickfix content" },
      { "<", "<Cmd>lua require('quicker').collapse()<CR>", desc = "Collapse quickfix content" },
    },
  })
end)

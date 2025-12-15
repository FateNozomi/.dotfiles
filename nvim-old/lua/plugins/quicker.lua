return {
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {
      keys = {
        { ">", "<cmd>lua require('quicker').expand()<CR>", desc = "Expand quickfix content" },
        { "<", "<cmd>lua require('quicker').collapse()<CR>", desc = "Collapse quickfix content" },
      },
    },
    config = function(_, opts)
      require("quicker").setup(opts)
      vim.keymap.set("n", "<leader>q", function() require("quicker").toggle() end, {
        desc = "Toggle quickfix",
      })
      vim.keymap.set("n", "<leader>l", function() require("quicker").toggle({ loclist = true }) end, {
        desc = "Toggle loclist",
      })
    end,
  },
}

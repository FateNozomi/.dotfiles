return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      keymaps = {
        ["cd"] = { "actions.cd", mode = "n" },
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    keys = {
      { "<leader>-", "<CMD>Oil<CR>", desc = "Oil Explorer" },
    },
  },
}

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      statuscolumn = {
        enabled = true,
        folds = {
          open = true,
          git_hl = true,
        },
      },
      zen = {
        enabled = true,
        toggles = {
          dim = false,
        },
      },
    },
    keys = {
      {
        "-",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
    },
  },
}

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = { enabled = true },
      indent = { enabled = true },
      statuscolumn = {
        enabled = true,
        folds = {
          open = true,
          git_hl = true,
        },
      },
    },
  },
}

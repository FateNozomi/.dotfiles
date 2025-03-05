return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
    config = function()
      require("typescript-tools").setup({
        settings = {
          tsserver_format_options = {
            semicolons = "insert",
          },
          jsx_close_tag = {
            enable = true,
          },
        },
      })
    end,
  },
}

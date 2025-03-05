return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
      require("fzf-lua").setup({
        winopts = {
          preview = { layout = "vertical" },
        },
      })
    end,
  },
}

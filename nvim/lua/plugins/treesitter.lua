return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c_sharp" },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = false,
        },
      })

      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldlevel = 99
    end,
  },
}

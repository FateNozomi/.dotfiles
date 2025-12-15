return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "c_sharp",
        "javascript",
        "json",
        "jsonc",
        "typescript",
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
      },
      indent = {
        enable = false,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldlevel = 99
    end,
  },
}

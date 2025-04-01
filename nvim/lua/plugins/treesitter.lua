return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opt = {
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
    config = function()
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldlevel = 99
    end,
  },
}

return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      -- text editing
      require("mini.pairs").setup()
      require("mini.surround").setup()
      -- worlkflow
      require("mini.files").setup({ windows = { preview = true } })
      require("mini.pick").setup()
      -- appearance
      require("mini.indentscope").setup()
    end,
    keys = {
      -- mini.files
      {
        "-",
        function()
          local buf_name = vim.api.nvim_buf_get_name(0)
          local target_path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
          MiniFiles.open(target_path)
          vim.schedule(function() MiniFiles.reveal_cwd() end)
        end,
        -- function() MiniFiles.open() end,
        desc = "File Explorer",
      },
      -- mini.pick
      { "<C-p>", function() MiniPick.builtin.files() end, desc = "Pick Files" },
      { "<leader>/", function() MiniPick.builtin.grep_live() end, desc = "Grep" },
      { "<leader>fb", function() MiniPick.builtin.buffers() end, desc = "Buffers" },
      { "<leader>sh", function() MiniPick.builtin.help() end, desc = "Help Pages" },
    },
  },
}

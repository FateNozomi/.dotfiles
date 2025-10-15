return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      -- text editing
      require("mini.pairs").setup()
      require("mini.surround").setup()
      -- worlkflow
      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },

          -- `[` and `]` key
          { mode = "n", keys = "[" },
          { mode = "x", keys = "[" },
          { mode = "n", keys = "]" },
          { mode = "x", keys = "]" },
        },
        clues = {
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
        window = {
          config = { width = "auto" },
          delay = 200,
          -- Keys to scroll inside the clue window
          scroll_down = "<C-d>",
          scroll_up = "<C-u>",
        },
      })
      require("mini.diff").setup({
        view = {
          style = "sign",
        },
      })
      require("mini.extra").setup()
      require("mini.files").setup({ windows = { preview = true } })
      require("mini.pick").setup({
        mappings = {
          choose_marked = "<C-q>",
        },
        window = { config = { width = vim.o.columns } },
      })
      -- appearance
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
      require("mini.indentscope").setup()
    end,
    keys = {
      -- mini.diff
      { "<leader>gdo", function() MiniDiff.toggle_overlay(0) end, desc = "Toggle Diff Overlay" },
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
      {
        "<leader>fb",
        function()
          local wipeout_cur = function() vim.api.nvim_buf_delete(MiniPick.get_picker_matches().current.bufnr, {}) end
          local buffer_mappings = { wipeout = { char = "<C-d>", func = wipeout_cur } }
          MiniPick.builtin.buffers(nil, { mappings = buffer_mappings })
        end,
        desc = "Buffers",
      },
      { "<leader>sh", function() MiniPick.builtin.help() end, desc = "Help Pages" },
      -- mini.extra
      { "<leader>s/", function() MiniExtra.pickers.history() end, desc = "Command/Search/Input History" },
      { '<leader>s"', function() MiniExtra.pickers.registers() end, desc = "Registers" },
      { "<leader>sd", function() MiniExtra.pickers.diagnostic() end, desc = "Diagnostics" },
      { "<leader>se", function() MiniExtra.pickers.explorer() end, desc = "File Explorer" },
      { "<leader>sm", function() MiniExtra.pickers.marks() end, desc = "Marks" },
      { "<leader>fo", function() MiniExtra.pickers.oldfiles() end, desc = "Old Files" },
      { "<leader>sq", function() MiniExtra.pickers.list({ scope = "quickfix" }) end, desc = "Quickfix List" },
    },
  },
}

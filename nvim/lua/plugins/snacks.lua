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
      picker = {
        enabled = true,
        layout = {
          preset = "vertical",
        },
      },
      statuscolumn = {
        enabled = true,
        folds = {
          open = true,
          git_hl = true,
        },
      },
      words = { enabled = true },
      zen = {
        enabled = true,
        toggles = {
          dim = false,
        },
      },
    },
    keys = {
      -- Top Pickers & Explorer
      { "<C-p>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      { "-", function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      -- find
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      {
        "<leader>fc",
        function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
        desc = "Find Config File",
      },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
      -- git
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      -- Grep
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
      {
        "<leader>sw",
        function() Snacks.picker.grep_word() end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
      },
      -- search
      { "<leader>s?", function() Snacks.picker() end, desc = "Snacks Picker" },
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      -- LSP
      { "<leader>ld", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "<leader>lD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "<leader>lr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "<leader>lI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "<leader>ly", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
      -- Other
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>ft", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    },
  },
}

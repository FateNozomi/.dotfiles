-- Centered on screen
local win_config = function()
  local height = math.floor(0.7 * vim.o.lines)
  local width = math.floor(0.8 * vim.o.columns)
  return {
    anchor = "NW",
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

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
      require("mini.extra").setup()
      require("mini.pick").setup({ window = { config = win_config } })
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

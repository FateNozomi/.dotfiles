return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>H", function() harpoon:list():add() end, { desc = "Add to Harpoon" })
      vim.keymap.set(
        "n",
        "<leader>h",
        function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "List Harpoon" }
      )
      vim.keymap.set("n", "<leader>[", function() harpoon:list():prev() end, { desc = "Previous Harpoon" })
      vim.keymap.set("n", "<leader>]", function() harpoon:list():next() end, { desc = "Next Harpoon" })
    end,
  },
}

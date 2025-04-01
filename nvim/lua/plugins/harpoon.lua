return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup();

      vim.keymap.set("n", "<leader>hh", function() harpoon:list():add() end, { desc = 'Add to Harpoon' })
      vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'List Harpoon' })
      vim.keymap.set("n", "<leader>hn", function() harpoon:list():prev() end, { desc = 'Jump to the previous Harpoon' })
      vim.keymap.set("n", "<leader>hp", function() harpoon:list():next() end, { desc = 'Jump to the next Harpoon' })
    end
  }
}

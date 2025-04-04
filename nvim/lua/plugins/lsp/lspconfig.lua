return {
  {
    enabled = false,
    "neovim/nvim-lspconfig",
    dependencies = { "folke/lazydev.nvim" },
    opts = {
      servers = {
        jsonls = {},
        lua_ls = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
      vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
        callback = function() vim.lsp.codelens.refresh({ bufnr = 0 }) end,
      })
    end,
  },
}

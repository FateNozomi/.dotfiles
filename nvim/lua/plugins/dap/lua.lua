return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      dap.adapters["lua-local"] = {
        type = "executable",
        command = "node",
        args = { "/opt/local-lua-debugger-vscode/0.3.3/extension/debugAdapter.js" },
        enrich_config = function(config, on_config)
          if not config["extensionPath"] then
            local c = vim.deepcopy(config)
            c.extensionPath = "/opt/local-lua-debugger-vscode/0.3.3/"
            on_config(c)
          else
            on_config(config)
          end
        end,
      }

      dap.configurations.lua = {
        {
          type = "lua-local",
          request = "launch",
          name = "Lua: Debug",
          cwd = "${workspaceFolder}",
          program = {
            lua = "lua",
            file = "${file}",
          },
        },
      }
    end,
  },
}

---@class ExceptionBreakpointFilters
---@field filter string
---@field label string

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },

    -- stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },

    config = function()
      local dap = require("dap")

      ---@param exception_breakpoint_filters ExceptionBreakpointFilters[]
      ---@return string[]
      local function get_filters(exception_breakpoint_filters)
        local filters = {}
        if exception_breakpoint_filters ~= nil then
          for _, x in pairs(exception_breakpoint_filters) do
            if x.filter ~= nil then
              table.insert(filters, x.filter)
            end
          end
        end

        return filters
      end

      local function set_exception_breakpoints()
        local filters = vim.g.dap_selected_exception_breakpoint_filters
        if filters == nil then
          return
        elseif type(filters) == "string" then
          vim.notify("Exception breakpoint filters: " .. vim.g.dap_selected_exception_breakpoint_filters)
        elseif filters[1] ~= nil then
          vim.notify(
            "Exception breakpoint filters: " .. table.concat(vim.g.dap_selected_exception_breakpoint_filters, ", ")
          )
        end
        dap.set_exception_breakpoints(filters)
      end

      local function toggle_exception_breakpoints()
        local selected_filters = vim.g.dap_selected_exception_breakpoint_filters
        if selected_filters == nil or selected_filters == "default" then
          selected_filters = vim.g.dap_exception_breakpoint_filters
        else
          selected_filters = "default"
        end

        vim.g.dap_selected_exception_breakpoint_filters = selected_filters
        set_exception_breakpoints()
      end

      dap.listeners.after["configurationDone"]["exception_breakpoints"] = function(session, _)
        vim.g.dap_exception_breakpoint_filters = get_filters(session.capabilities.exceptionBreakpointFilters)
      end

      vim.keymap.set("n", "<leader>de", toggle_exception_breakpoints, { desc = "Toggle Exception Breakpoint" })
    end,
  },

  -- fancy UI for the debugger
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },

    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
    },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({}) end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close({}) end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close({}) end
    end,
  },
}

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
dapui.setup({
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    select_window = function()
        return 1;
    end,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = {
        {
            elements = {
                {
                    id = "repl",
                    size = 1,
                },
            },
            position = "bottom",
            size = 10
        },
        -- {
        --     elements = {
        --         {
        --             id = "stacks",
        --             size = 0.5,
        --         },
        --         {
        --             id = "scopes",
        --             size = 0.5,
        --         },
        --     },
        --     position = "right",
        --     size = 10
        -- },
  },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
})

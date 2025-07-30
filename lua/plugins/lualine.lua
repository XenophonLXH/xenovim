return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons", opt = true
    },
    config = function()
        require('lualine').setup {
            options = {
                icons_enbaled = true,
                theme = 'auto',
                component_separators = { left = '>', right = '|' },
                section_separators = { left = ' ⋙  ', right = '⋘  ' },
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
                ignore_focus = {
                    'NeoTree',
                    'neo-tree',
                    'NeogitStatus',
                    'nvim-dap-repl',
                    'nvim-dap-ui',
                    'dap-ui',
                    "dapui_watches",
                    "dapui_breakpoints",
                    "dapui_scopes",
                    "dapui_console",
                    "dapui_stacks",
                    'dap-repl',
                },
                disabled_filetypes = {
                    'nvim-dap-repl',
                    'nvim-dap-ui',
                    'dap-ui',
                    "dapui_watches",
                    "dapui_breakpoints",
                    "dapui_scopes",
                    "dapui_console",
                    "dapui_stacks",
                    'dap-repl',
                },
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'location', 'progress' },
                lualine_z = {'os.date("%H:%M")'},
            },
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {'branch'}
            }
        }
    end,
}

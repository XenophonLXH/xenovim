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
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'location', 'progress' },
        lualine_z = {'os.date("%H:%M")'},
    },
}

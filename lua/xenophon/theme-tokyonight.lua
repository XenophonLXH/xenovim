require("tokyonight").setup({
    style = "moon", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
    light_style = "day", -- The theme is used when the background is set to light
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    dim_inactive = true, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
    cache = true,
})

vim.cmd([[colorscheme tokyonight]])
vim.cmd([[hi Cursor guibg=red]])
vim.cmd([[set guicursor=n-v-c:block-Cursor/lCursor]])
vim.cmd [[
hi BufferLineFill guibg='#19172400'
hi BufferLineSeparator guibg='#19172400'
hi BufferLineSeparatorVisible guibg='#191724'
set termguicolors
]]

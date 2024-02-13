-- Set Color Scheme
vim.o.termguicolors = true

-- Set Background to Clear
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

-- Configure catppuccin
-- require('catppuccin').setup({
--     flavour = "macchiato",
--     transparent_background = true,
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = true,
--         mini = true,
--     },
-- })
-- vim.cmd.colorscheme "catppuccin"

-- Gruvbox
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_foreground = "hard"
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_transparent_background = 1
-- vim.g.gruvbox_material_dim_inactive_windows = 1
-- vim.cmd.colorscheme "gruvbox-material"

-- Moonfly:
-- vim.g.moonflyTransparent = true
-- vim.g.moonflyTerminalColors = true
-- vim.o.background = "dark"
-- vim.cmd.colorscheme "moonfly"
-- vim.g.moonflyItalics = false
-- vim.g.moonflyCursorColor = true
-- vim.g.moonflyUnderlineMatchParen = true
-- vim.g.lightline = {colorscheme="moonfly"}
-- vim.g.moonflyVirtualTextColor = true

-- Sonokai
-- vim.g.sonokai_style = 'andromeda'
-- vim.g.sonokai_better_performance = 1
-- vim.g.sonokai_transparent_background = 2
-- vim.g.sonokai_dim_inactive_windows = 1
-- vim.g.sonoaki_menu_selection_background = 'red'
-- vim.cmd.colorscheme "sonokai"

-- Midnight
-- vim.cmd.colorscheme "midnight"
-- require('midnight').setup {
--     HighlightGroup = {
--         clear = true
--     },
-- }
--

-- Bamboo
-- Lua
require('bamboo').setup {
  -- Main options --
  -- NOTE: to use the light theme, set `vim.o.background = 'light'`
  style = 'vulgaris', -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
  toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
  toggle_style_list = { 'vulgaris', 'multiplex', 'light' }, -- List of styles to toggle between
  transparent = true, -- Show/hide background
  dim_inactive = false, -- Dim inactive windows/buffers
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'italic',
    conditionals = 'italic',
    keywords = 'none',
    functions = 'bold',
    namespaces = 'italic',
    parameters = 'italic',
    strings = 'none',
    variables = 'none',
  },

  -- Lualine options --
  lualine = {
    transparent = true, -- lualine center bar transparency
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = false, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}
vim.cmd.colorscheme "bamboo"

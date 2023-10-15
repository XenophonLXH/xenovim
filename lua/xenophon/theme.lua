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



-- Configure Kanagawa
-- require('kanagawa').setup({
--     compile = false,             -- enable compiling the colorscheme
--     undercurl = true,            -- enable undercurls
--     commentStyle = { italic = true },
--     functionStyle = {},
--     keywordStyle = { italic = true},
--     statementStyle = { bold = true },
--     typeStyle = {},
--     transparent = true,         -- do not set background color
--     dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--     colors = {                   -- add/modify theme and palette colors
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--     },
--     overrides = function(colors) -- add/modify highlights
--         return {}
--     end,
--     theme = "wave",              -- Load "wave" theme when 'background' option is not set
--     background = {               -- map the value of 'background' option to a theme
--         dark = "wave",           -- options: wave,dragon,lotus
--         light = "lotus"
--     },
-- })

-- Kanagawa
-- overrides = function(colors)
--     local theme = colors.theme
--     return {
--         TelescopeTitle = { fg = theme.ui.special, bold = true },
--         TelescopePromptNormal = { bg = theme.ui.bg_p1 },
--         TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
--         TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
--         TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
--         TelescopePreviewNormal = { bg = theme.ui.bg_dim },
--         TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
--     }
-- end,


-- Kanagawa
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "kanagawa",
--     callback = function()
--         if vim.o.background == "light" then
--             vim.fn.system("kitty +kitten themes Kanagawa_light")
--         elseif vim.o.background == "dark" then
--             vim.fn.system("kitty +kitten themes Kanagawa_dragon")
--         else
--             vim.fn.system("kitty +kitten themes Kanagawa")
--         end
--     end,
-- })

-- Gruvbox
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_background = "hard"
-- vim.g.gruvbox_material_foreground = "material"
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_dim_inactive_windows = 1

-- Moonfly:
-- vim.g.moonflyTransparent = true
-- vim.g.moonflyTerminalColors = false
-- vim.o.background = "dark"


-- Sonokai
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_transparent_background = 2
vim.g.sonokai_dim_inactive_windows = 1
vim.g.sonoaki_menu_selection_background = 'red'

vim.cmd.colorscheme "sonokai"

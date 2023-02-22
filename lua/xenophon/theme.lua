-- Set Color Scheme
vim.o.termguicolors = true

-- Set Background to Clear
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

-- Configure catppuccin
require('catppuccin').setup({
    flavour = "macchiato",
    transparent_background = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = true,
    },
})
vim.cmd.colorscheme "catppuccin"

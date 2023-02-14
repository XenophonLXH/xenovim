-- Set Color Scheme
vim.o.termguicolors = true
vim.cmd [[colorscheme sonokai]]

-- Set Background to Clear
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})


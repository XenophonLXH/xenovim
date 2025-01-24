-- Set Color Scheme
vim.o.termguicolors = true


-- Set Background to Clear
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

-- lua
vim.cmd([[hi Cursor guibg=red]])
vim.cmd([[set guicursor=n-v-c:block-Cursor/lCursor]])
-- vim.api.guicursor = "guicursor=n-v-c:block-Cursor/lCursor"
-- vim.api.guicursor = "guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50"

-- Line Numbers --
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabbing --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- GUI Colors
vim.opt.termguicolors = true

-- Misc
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Load Speed
vim.opt.updatetime = 50

-- Bufferlne settings
vim.opt.laststatus = 3

-- Notifications
vim.notify = require("notify")

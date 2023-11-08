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

-- Shared clipboard accross instances and system
vim.opt.clipboard = "unnamedplus"

-- Enable highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
  end,
})

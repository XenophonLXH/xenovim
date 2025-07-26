local opt = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.termguicolors = true

-- Lsp settings
vim.lsp.set_log_level("off")

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.g.pyindent_open_paren = 0
vim.opt.signcolumn = "no"
vim.diagnostic.config({
  virtual_text = true,
})

--- Enable Blamer
vim.g.blamer_enabled = 1

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
opt.shiftround = true -- Round indent

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

-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"

opt.autowrite = true -- Enable auto write

opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer

opt.cursorline = true -- Enable highlighting of the current line

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

opt.foldlevel = 99

opt.ignorecase = true -- Ignore case
opt.linebreak = true -- Wrap lines at convenient points

opt.list = true -- Show some invisible characters (tabs...

opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current

opt.undofile = true
opt.undolevels = 10000

opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.isfname:append("@-@")

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Copilot
vim.g.copilot_no_tab_map = true

-- Borders
vim.opt.winborder = 'rounded'

-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

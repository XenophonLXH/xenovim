local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }


-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)


-- Neotree
keymap("n", "<C-o>", ":Neotree toggle left reveal_force_cwd<cr>", default_opts) -- focus tree and reveal current file
keymap("n", "<C-Shift-o>", ":Neotree close <cr>", default_opts) -- close tree
keymap("n", "<C-g>", ":Neotree toggle float git_status<cr>", default_opts) -- Show git status float


-- ToggleTerm
keymap("n", "<C-t>", ":ToggleTerm size=5 direction=float<cr>", default_opts)

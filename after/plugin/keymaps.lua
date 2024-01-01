local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Resizing panes
keymap("n", "<C-Left>", ":vertical resize +2<CR>", default_opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", default_opts)
keymap("n", "<C-Up>", ":resize -1<CR>", default_opts)
keymap("n", "<C-Down>", ":resize +1<CR>", default_opts)

-- Neotree
keymap("n", "<leader>o", ":Neotree left reveal_force_cwd<cr>", default_opts) -- focus tree and reveal current file
keymap("n", "<leader>e", ":Neotree toggle<cr>", default_opts) -- close tree 
keymap("n", "<C-g>", ":Neotree toggle float git_status<cr>", default_opts) -- Show git status float

-- ToggleTerm
keymap("n", "<C-t>", ":ToggleTerm size=5 direction=float<cr>", default_opts)
keymap("n", "<F9>", "<cmd>3TermExec size=50 cmd='todo' direction=vertical go_back=0 <CR>", default_opts)
keymap("n", "<F8>", "<cmd>TermExec cmd='python' go_back=0 <CR>", default_opts)
keymap("n", "<F7>", "<cmd>2TermExec cmd='lazygit' go_back=0 direction=float <cr>", default_opts)

-- Buffer Navigation
keymap("n", "<S-l>", "<cmd>bnext<cr>", default_opts)
keymap("n", "<S-h>", "<cmd>bprevious<cr>", default_opts)

-- File Operations
keymap("n", "<C-s>", "<cmd>w<cr><cr>", default_opts)
keymap("n", "<C-q>", "<cmd>q<cr><cr>", default_opts)
keymap("n", "<leader>qq", "<cmd>q<cr><cr>", default_opts)
keymap("n", "|", "<cmd>vsplit<cr>", default_opts)
-- keymap("n", "\\", "<cmd>split<cr>", default_opts)

-- Move lines up or down
keymap("n", "<A-j>", "<cmd>m .+1<CR>", default_opts)
keymap("n", "<A-k>", "<cmd>m .-2<CR>", default_opts)


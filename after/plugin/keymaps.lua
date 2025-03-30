local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Resizing panes
keymap("n", "<C-Left>", ":vertical resize +5<CR>", default_opts)
keymap("n", "<C-Right>", ":vertical resize -5<CR>", default_opts)
keymap("n", "<C-Up>", ":resize -1<CR>", default_opts)
keymap("n", "<C-Down>", ":resize +1<CR>", default_opts)

-- Neotree
keymap("n", "<leader>o", ":Neotree left reveal_force_cwd<cr>", default_opts) -- focus tree and reveal current file
keymap("n", "<leader>e", ":Neotree toggle<cr>", default_opts) -- close tree 
keymap("n", "<C-g>", ":Neotree toggle float git_status<cr>", default_opts) -- Show git status float

-- ToggleTerm
keymap("n", "<C-t>", ":ToggleTerm size=5 direction=float<cr>", default_opts)
keymap("n", "<F7>", "<cmd>2TermExec cmd='lazygit' go_back=0 direction=float <cr>", default_opts)

-- Buffer Navigation
keymap("n", "<S-l>", "<cmd>bnext<cr>", default_opts)
keymap("n", "<S-h>", "<cmd>bprevious<cr>", default_opts)
keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- File Operations
keymap("n", "<C-s>", "<cmd>w<cr><cr>", default_opts)
keymap("n", "<C-q>", "<cmd>q<cr><cr>", default_opts)
keymap("n", "<leader>qq", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", default_opts)
keymap("n", "|", "<cmd>vsplit<cr>", default_opts)
keymap("n", "\\", "<cmd>split<cr>", default_opts)
keymap("n", "<leader>bc", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", default_opts)

-- Move lines up or down
keymap("n", "<A-j>", "<cmd>m .+1<CR>", default_opts)
keymap("n", "<A-k>", "<cmd>m .-2<CR>", default_opts)

-- Moved

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- Search File by name
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {}) -- Search Grep
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- Search Buffers
vim.keymap.set('n', '<leader>ht', builtin.help_tags, {}) -- Find Help
vim.keymap.set('n', '<leader>sw', builtin.grep_string, {}) -- Grep String
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {}) -- Go to definition
vim.keymap.set('n', '<leader>gf', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)
vim.keymap.set('n', '<leader>fu', builtin.lsp_references, {})

--- Vim
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)  -- Exit Vim File
--- Smart Splitter local smartsplits = require('smart-splits')
vim.keymap.set('n', '<A-m>', function() require("smart-splits").move_cursor_down() end, { desc = 'Move to down' })
vim.keymap.set('n', '<A-h>', function() require("smart-splits").move_cursor_left() end, { desc = 'Move to left' })
vim.keymap.set('n', '<A-n>', function() require("smart-splits").move_cursor_up() end, { desc = 'Move to up' })
vim.keymap.set('n', '<A-l>', function() require("smart-splits").move_cursor_right() end, { desc = 'Move to right' })

--- Remap Page Up/Down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--- Debug
vim.keymap.set("n", "<F2>", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<F8>", "<cmd> lua require('dap').terminate() <CR>")
vim.keymap.set("n", "<F4>", "<cmd> lua require('dap').restart() <CR>")
vim.keymap.set("n", "<F5>", "<cmd> lua _G.Runner() <CR>")
vim.keymap.set("n", "<F9>", "<cmd> lua _G.Conditional() <CR>")
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

-- New
-- Move Lines
keymap("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
keymap("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
keymap("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- better up/down
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- better indenting
keymap("v", "<", "<gv", {})
keymap("v", ">", ">gv", {})

-- commenting
keymap("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
keymap("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- quickfix list
vim.keymap.set("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

-- location list
vim.keymap.set("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })


local builtin = require('telescope.builtin')
local default_opts = { noremap = true, silent = true }

-- Resizing panes
vim.keymap.set("n", "<C-Left>", ":vertical resize +5<CR>", default_opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -5<CR>", default_opts)
vim.keymap.set("n", "<C-Up>", ":resize -1<CR>", default_opts)
vim.keymap.set("n", "<C-Down>", ":resize +1<CR>", default_opts)

-- Neotree
vim.keymap.set("n", "<leader>o", ":Neotree left reveal_force_cwd<cr>", default_opts) -- focus tree and reveal current file
vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>", default_opts) -- close tree 
vim.keymap.set("n", "<C-g>", ":Neotree toggle float git_status<cr>", default_opts) -- Show git status float

-- ToggleTerm
vim.keymap.set("n", "<C-t>", ":ToggleTerm size=5 direction=float<cr>", default_opts)

-- Buffer Navigation
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", default_opts)
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", default_opts)
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- File Operations
vim.keymap.set("n", "<C-s>", "<cmd>w<cr><cr>", default_opts)
vim.keymap.set("n", "<leader>qq", "<cmd>q<cr><cr>", default_opts)
vim.keymap.set("n", "<C-q>", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", default_opts)
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", default_opts)
vim.keymap.set("n", "\\", "<cmd>split<cr>", default_opts)
vim.keymap.set("n", "<leader>bc", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", default_opts)

-- Move lines up or down
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>", default_opts)
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>", default_opts)

-- Copilot
vim.keymap.set("n", "<leader>coo", "<cmd>Copilot disable<cr>", default_opts)
vim.keymap.set("n", "<leader>cee", "<cmd>Copilot enable<cr>", default_opts)
vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

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

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- better up/down
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- better indenting
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})

-- commenting
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

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

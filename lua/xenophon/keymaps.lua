------KeyMaps--
---------------

----------  -----------
-- Leader:    <space>
----------  -----------
vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap


--- Vim
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)  -- Exit Vim File


--- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- Search File by name
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {}) -- Search Grep
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- Search Buffers
vim.keymap.set('n', '<leader>ht', builtin.help_tags, {}) -- Find Help
vim.keymap.set('n', '<leader>sw', builtin.grep_string, {}) -- Grep String
vim.keymap.set('n', '<leader>gf', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)


--- Smart Splitter
local smartsplits = require('smart-splits')
vim.keymap.set('n', '<A-h>', function() require("smart-splits").move_cursor_left() end, { desc = 'Move to left' })
-- vim.keymap.set('n', '<A-j>', function() require("smart-splits").move_cursor_down() end, { desc = 'Move to down' })
-- vim.keymap.set('n', '<A-k>', function() require("smart-splits").move_cursor_up() end, { desc = 'Move to up' })
vim.keymap.set('n', '<A-l>', function() require("smart-splits").move_cursor_right() end, { desc = 'Move to right' })


-- Remap Page Up/Down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

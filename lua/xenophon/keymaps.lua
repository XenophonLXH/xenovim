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
vim.keymap.set('n', '<leader>gf', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)

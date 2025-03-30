------KeyMaps--
---------------

----------  -----------
-- Leader:    <space>
----------  -----------
vim.g.mapleader = " "


--- Obsidian
-- File Manipulation
vim.keymap.set("n", "<leader><leader>oo", "<cmd> lua _G.ObsidianOpen() <CR>")
vim.keymap.set("n", "<leader><leader>os", "<cmd> lua _G.ObsidianQuickSwitch() <CR>")
vim.keymap.set("n", "<leader><leader>on", "<cmd> lua _G.ObsidianNew() <CR>")
-- Folder Manipulation
vim.keymap.set("n", "<leader><leader>od", "<cmd> lua _G.ObsidianDirectory() <CR>")
-- Dailies
vim.keymap.set("n", "<leader><leader>ot", "<cmd> lua _G.ObsidianToday() <CR>")
vim.keymap.set("n", "<leader><leader>oy", "<cmd> lua _G.ObsidianYesterday() <CR>")
vim.keymap.set("n", "<leader><leader>ott", "<cmd> lua _G.ObsidianTomorrow() <CR>")
-- Workspace
vim.keymap.set("n", "<leader><leader>ow", "<cmd> lua _G.ObsidianWorkspace() <CR>")

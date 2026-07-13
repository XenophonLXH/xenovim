local builtin = require('telescope.builtin')
local default_opts = { noremap = true, silent = true }

-- Resizing panes
vim.keymap.set("n", "<C-Left>",  ":vertical resize +5<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize -5<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Up>",    ":resize -1<CR>",          { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Down>",  ":resize +1<CR>",          { desc = "Increase window height" })

-- ToggleTerm
vim.keymap.set("n", "<C-t>", ":ToggleTerm size=5 direction=float<cr>", { desc = "Toggle floating terminal" })

-- Buffer Navigation
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>",     { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "[b",    "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "]b",    "<cmd>bnext<cr>",     { desc = "Next buffer" })

-- File Operations
vim.keymap.set("n", "<C-s>",      "<cmd>w<cr><cr>",                      { desc = "Save file" })
vim.keymap.set("n", "<leader>qq", "<cmd>q<cr><cr>",                      { desc = "Quit" })
vim.keymap.set("n", "<C-q>",      "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>",    { desc = "Close buffer" })
vim.keymap.set("n", "|",          "<cmd>vsplit<cr>",                      { desc = "Vertical split" })
vim.keymap.set("n", "\\",         "<cmd>split<cr>",                       { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>bc", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>",    { desc = "Close buffer" })

-- Theme switcher
vim.keymap.set("n", "<leader>ct", function() require('utils.theme_switcher').pick() end, { desc = "Switch theme" })

-- Copilot
vim.keymap.set("n", "<leader>coo", "<cmd>Copilot disable<cr>", { desc = "Disable Copilot" })
vim.keymap.set("n", "<leader>cee", "<cmd>Copilot enable<cr>",  { desc = "Enable Copilot" })
vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
    desc = "Accept Copilot suggestion",
    expr = true,
    replace_keycodes = false,
})

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files,    { desc = "Find file by name" })
vim.keymap.set('n', '<leader>fb', builtin.buffers,       { desc = "Find open buffer" })
vim.keymap.set('n', '<leader>ht', builtin.help_tags,     { desc = "Search help tags" })
vim.keymap.set('n', '<leader>sw', builtin.grep_string,   { desc = "Grep word under cursor" })
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = "Go to definition" })
vim.keymap.set('n', '<leader>fu', builtin.lsp_references,  { desc = "Find usages" })
vim.keymap.set('n', '<leader>gf', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep string" })
vim.keymap.set('n', '<leader>lg', function()
    builtin.live_grep({
        on_input_filter_cb = function(prompt)
            local parts = vim.split(prompt, "  ", { plain = true })
            if #parts < 2 then
                return { prompt = prompt }
            end
            local query = parts[1]
            local glob = vim.trim(parts[2])
            return {
                prompt = query,
                updated_finder = require('telescope.finders').new_job(
                    function(search)
                        if not search or search == "" then return nil end
                        local args = vim.deepcopy(require('telescope.config').values.vimgrep_arguments)
                        if glob ~= "" then
                            vim.list_extend(args, { "--glob", glob })
                        end
                        vim.list_extend(args, { "--", search, "." })
                        return args
                    end,
                    require('telescope.make_entry').gen_from_vimgrep({}),
                    nil,
                    vim.fn.getcwd()
                )
            }
        end,
    })
end, { desc = "Live grep (query  *.ext to filter by type)" })

-- Vim
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- Smart splits
vim.keymap.set('n', '<A-j>', function() require("smart-splits").move_cursor_down() end,  { desc = "Move to window below" })
vim.keymap.set('n', '<A-h>', function() require("smart-splits").move_cursor_left() end,  { desc = "Move to window left" })
vim.keymap.set('n', '<A-k>', function() require("smart-splits").move_cursor_up() end,    { desc = "Move to window above" })
vim.keymap.set('n', '<A-l>', function() require("smart-splits").move_cursor_right() end, { desc = "Move to window right" })

-- Page up/down centred
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down (centred)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up (centred)" })

-- Diffview
vim.keymap.set("n", "<F6>", "<cmd>lua _G.DiffviewToggle()<CR>", { desc = "Toggle diffview" })

-- Debug
vim.keymap.set("n", "<F2>", "<cmd>DapToggleBreakpoint<CR>",               { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<F4>", "<cmd>lua require('dap').restart()<CR>",      { desc = "Restart debugger" })
vim.keymap.set("n", "<F5>", "<cmd>lua _G.Runner()<CR>",                   { desc = "Run debugger" })
vim.keymap.set("n", "<F8>", "<cmd>lua require('dap').terminate()<CR>",    { desc = "Terminate debugger" })
vim.keymap.set("n", "<F9>", "<cmd>lua _G.Conditional()<CR>",              { desc = "Conditional breakpoint" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end,   { desc = "Step over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end,   { desc = "Step into" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end,    { desc = "Step out" })

-- Move lines
vim.keymap.set("n", "<A-m>", "<cmd>execute 'move .+' . v:count1<cr>==",                              { desc = "Move line down" })
vim.keymap.set("n", "<A-n>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",                        { desc = "Move line up" })
vim.keymap.set("i", "<A-m>", "<esc><cmd>m .+1<cr>==gi",                                               { desc = "Move line down" })
vim.keymap.set("i", "<A-n>", "<esc><cmd>m .-2<cr>==gi",                                               { desc = "Move line up" })
vim.keymap.set("v", "<A-m>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",                  { desc = "Move selection down" })
vim.keymap.set("v", "<A-n>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",            { desc = "Move selection up" })

-- Search results (saner n/N behaviour)
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]",      { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]",      { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]",      { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]",      { expr = true, desc = "Prev search result" })

-- Better up/down (wrapped lines)
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = "Save file" })
vim.keymap.set({ "n", "x" }, "j",      "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down" })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down" })
vim.keymap.set({ "n", "x" }, "k",      "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up" })
vim.keymap.set({ "n", "x" }, "<Up>",   "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up" })

-- Indenting (stay in visual mode)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Comments
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment below" })
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment above" })

-- Quickfix / location lists
vim.keymap.set("n", "<leader>xq", function()
    local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
    if not success and err then vim.notify(err, vim.log.levels.ERROR) end
end, { desc = "Toggle quickfix list" })

vim.keymap.set("n", "<leader>xl", function()
    local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
    if not success and err then vim.notify(err, vim.log.levels.ERROR) end
end, { desc = "Toggle location list" })

-- Leap
vim.keymap.set({'n', 'x', 'o'}, 'zk', '<Plug>(leap-forward)',     { desc = "Leap forward" })
vim.keymap.set('n',             'zj', '<Plug>(leap-backward)',     { desc = "Leap backward" })
vim.keymap.set('n',             'gs', '<Plug>(leap-from-window)',  { desc = "Leap from window" })

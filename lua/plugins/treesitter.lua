return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter').setup()
            require('nvim-treesitter').install({
                "bash", "gitcommit", "go", "gomod", "gowork", "gosum",
                "javascript", "json", "python", "html", "lua", "luadoc",
                "luap", "query", "regex", "vim", "vimdoc", "yaml",
                "rust", "css", "xml", "csv", "ini", "sql", "hyprlang",
                "ssh_config",
            })
            vim.api.nvim_create_autocmd('FileType', {
                callback = function(ev)
                    local ok = pcall(vim.treesitter.start, ev.buf)
                    if ok then
                        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        lazy = false,
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                    selection_modes = {
                        ['@parameter.outer'] = 'v',
                        ['@function.outer'] = 'v',
                        ['@class.outer'] = '<c-v>',
                    },
                    include_surrounding_whitespace = false,
                },
            })
            local ts_select = require("nvim-treesitter-textobjects.select")
            local ts_move = require("nvim-treesitter-textobjects.move")
            local ts_swap = require("nvim-treesitter-textobjects.swap")

            local maps = {
                { { "x", "o" }, "ai", "@conditional.outer" },
                { { "x", "o" }, "ii", "@conditional.inner" },
                { { "x", "o" }, "al", "@loop.outer" },
                { { "x", "o" }, "il", "@loop.inner" },
                { { "x", "o" }, "ap", "@parameter.outer" },
                { { "x", "o" }, "ip", "@parameter.inner" },
            }
            for _, m in ipairs(maps) do
                local q = m[3]
                vim.keymap.set(m[1], m[2], function()
                    ts_select.select_textobject(q, "textobjects")
                end)
            end

            vim.keymap.set("n", "[f", function() ts_move.goto_previous_start("@function.outer", "textobjects") end)
            vim.keymap.set("n", "[c", function() ts_move.goto_previous_start("@class.outer", "textobjects") end)
            vim.keymap.set("n", "[p", function() ts_move.goto_previous_start("@parameter.inner", "textobjects") end)
            vim.keymap.set("n", "]f", function() ts_move.goto_next_start("@function.outer", "textobjects") end)
            vim.keymap.set("n", "]c", function() ts_move.goto_next_start("@class.outer", "textobjects") end)
            vim.keymap.set("n", "]p", function() ts_move.goto_next_start("@parameter.inner", "textobjects") end)

            vim.keymap.set("n", "<leader>a", function() ts_swap.swap_next("@parameter.inner", "textobjects") end)
            vim.keymap.set("n", "<leader>A", function() ts_swap.swap_previous("@parameter.inner", "textobjects") end)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            enable = true,
            max_lines = 2,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 5,
            trim_scope = 'inner',
            mode = 'topline',
            separator = nil,
            zindex = 500,
        },
    },
}

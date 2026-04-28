return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "bash", "gitcommit", "go", "gomod", "gowork", "gosum",
                    "javascript", "json", "python", "html", "lua", "luadoc",
                    "luap", "query", "regex", "vim", "vimdoc", "yaml",
                    "rust", "css", "xml", "csv", "ini", "sql", "hyprlang",
                    "ssh_config",
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
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

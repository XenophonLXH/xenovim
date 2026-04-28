return {
    'echasnovski/mini.ai',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
        local gen_spec = require('mini.ai').gen_spec
        require('mini.ai').setup({
            custom_textobjects = {
                f = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
                c = gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
            },
            mappings = {
                -- Main textobject prefixes
                around = 'a',
                inside = 'i',

                -- Next/last textobjects
                -- NOTE: These override built-in LSP selection mappings on Neovim>=0.12
                -- Map LSP selection manually to use it (see `:h MiniAi.config`)
                around_next = 'an',
                inside_next = 'in',
                around_last = 'am',
                inside_last = 'im',

                -- Move cursor to corresponding edge of `a` textobject
                goto_left = 'g[',
                goto_right = 'g]',
            },

            n_lines = 500,
        })
    end,
}

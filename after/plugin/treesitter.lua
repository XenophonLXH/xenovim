require 'nvim-treesitter.configs'.setup {

    ensure_install = { "c", "help", "javascript", "python", "html", "lua", "vim", "help"},

    sync_install = false,

    auto_install = true,

    highlight = {

        enable = true,
    },

    -- Indentation
    indent = true,

}

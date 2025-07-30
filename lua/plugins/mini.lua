return {
    'echasnovski/mini.nvim',
    dependencies = {
        'echasnovski/mini.nvim',
    },
    config = function()
        require('mini.indentscope').setup({
            symbol = '|',
        })
    end,
}

return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            autochdir = false,
            size = 1,
            float_opts = {
                width = 160,
                height = 50,
                winblend = 5,
                border = 'curved',
            },
        })
    end,
}

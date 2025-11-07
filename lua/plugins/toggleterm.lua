return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            autochdir = false,
            size = 1,
            float_opts = {
                width = 120,
                height = 30,
                winblend = 0,
                border = 'curved',
            },
            persist_mode = true,
        })
    end,
}

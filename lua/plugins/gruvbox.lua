return {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    config = function()
        require("gruvbox").setup({
            transparent_mode = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },
        })
    end,
}

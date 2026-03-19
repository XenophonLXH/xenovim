return {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
                sidebars = "transparent",
                floats = "transparent",
            },
        })
    end,
}

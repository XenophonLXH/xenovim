return {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    config = function()
        require("solarized-osaka").setup({
            transparent = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
            },
        })
    end,
}

return {
    "thesimonho/kanagawa-paper.nvim",
    lazy = true,
    config = function()
        require("kanagawa-paper").setup({
            transparent = true,
        })
    end,
}

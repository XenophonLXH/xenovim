return {
    "ramojus/mellifluous.nvim",
    lazy = true,
    config = function()
        require("mellifluous").setup({
            transparent_background = { enabled = true },
        })
    end,
}

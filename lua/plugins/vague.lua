return {
    "vague2k/vague.nvim",
    lazy = true,
    config = function()
        require("vague").setup({
            transparent = true,
        })
    end,
}

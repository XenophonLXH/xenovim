return {
    "olimorris/onedarkpro.nvim",
    lazy = true,
    config = function()
        require("onedarkpro").setup({
            options = {
                transparency = true,
                italic_comments = false,
                italic_keywords = false,
            },
        })
    end,
}
